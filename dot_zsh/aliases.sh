#!/usr/bin/env bash

# Git
git() {
  echo "+ git $*" >&2
  command git "$@"
}

# Docker
docker() {
  echo "+ docker $*" >&2
  command docker "$@"
}

alias dpsaw="watch docker ps -a"
alias dbake="docker buildx bake --allow=ssh"

# Kubectl
kubectl() {
  echo "+ kubectl $*" >&2
  command kubectl "$@"
}

# shellcheck disable=SC2139
alias kubectl="$HOMEBREW_PREFIX/bin/kubectl" # by default uses OrbStack's version
alias kubectl="kubecolor --force-colors"

# shellcheck disable=SC1090
[ -f "$ZDOTDIR"/.kubectl_aliases.sh ] && source <(sed -r "s/(kubectl.*) --watch/watch \1/g" "$ZDOTDIR"/.kubectl_aliases.sh)

alias klo="kubectl logs -f --tail=-1" # with selector only the last 10 lines are shown
alias klon="kubectl logs -f --tail=-1 --namespace"
alias hfa="helmfile apply --skip-diff-on-install --suppress-diff -f"

# General
alias ls=lsd
alias tree="lsd --tree --depth 1"
alias cat=bat
alias ps=procs
alias watch="viddy -d --shell=zsh --disable_auto_save"
alias diff=delta

alias c=clear
alias chz=chezmoi
# shellcheck disable=SC2139
alias chz-cd="cd $(chezmoi source-path)"
alias p=python
alias pm="python -m"
alias jl="jupyter lab --browser='open -a \"Google Chrome\" %s'"
alias pn=pnpm
alias jq=jaq
alias lzd=lazydocker
alias lzg=lazygit
alias mk=minikube
alias mba="mamba activate"
alias mbd="mamba deactivate"

eval "$(gh copilot alias -- zsh)"
