#!/usr/bin/env bash

# shellcheck disable=SC2154
nodes=${args[--nodes]}
use_cilium=${args[--cilium]:-0}

((use_cilium)) && cni=bridge && extra_config="--extra-config=kubeadm.skip-phases=addon/kube-proxy"

minikube start \
  --nodes="$nodes" \
  --cpus=no-limit \
  --memory=no-limit \
  --cni="${cni:-auto}" \
  --insecure-registry="host.minikube.internal:5000" \
  "${extra_config:-''}" \
  "${other_args[@]}"

worker_nodes=$(kubectl get nodes -o name | grep '\-')
for node in $worker_nodes; do kubectl label "$node" node-role.kubernetes.io/worker=worker; done
((nodes > 2)) && kubectl taint node minikube node-role.kubernetes.io/control-plane=:NoSchedule

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
helmfile="$SCRIPT_DIR/mk-start-src/helmfile.yaml"

if ((use_cilium)); then
  helmfile apply --skip-diff-on-install --suppress-diff -f "$helmfile" -l name=cilium \
    --set k8sServiceHost="$(minikube ip)" --set k8sServicePort=8443

  # without kube-proxy, we need to update CoreDNS to use the host's DNS server
  # see: https://github.com/cilium/cilium/issues/29113
  dns_server=$(scutil --dns | awk '/nameserver/ {print $3; exit}')
  kubectl get cm coredns -n kube-system -o yaml |
    sed "s/forward \. \/etc\/resolv\.conf/forward \. $dns_server/" |
    kubectl apply -f -
  kubectl rollout restart deploy coredns -n kube-system

  sleep 3

  # restart pods that are not using hostNetwork to pick up the Cilium CNI
  kubectl get pods -A -o custom-columns=1:.metadata.name,2:.spec.hostNetwork |
    awk '/<none>/ {print $1}' |
    xargs -r kubectl -n kube-system delete pod
fi

helmfile apply --skip-diff-on-install --suppress-diff -f "$helmfile" -l name!=cilium
