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
alias dcdnall="dco --profile '*' down --remove-orphans --volumes"

# Kubectl
kubectl() {
  echo "+ kubectl $*" >&2
  kubecolor "$@"
}

# shellcheck disable=SC1090
[ -f "$ZDOTDIR"/.kubectl_aliases.sh ] && source <(sed -r "s/(kubectl.*) --watch/watch \1/g" "$ZDOTDIR"/.kubectl_aliases.sh)

alias klo="kubectl logs -f --tail=-1" # with selector only the last 10 lines are shown
alias klon="kubectl logs -f --tail=-1 --namespace"
alias hfa="helmfile apply --skip-diff-on-install --suppress-diff -f"

# General
alias ls=lsd
alias tree="lsd --tree --depth 1"
alias ps="procs --tree"
alias watch="viddy -d --shell=zsh --disable_auto_save"
alias diff=delta

alias cat="bat -p"
alias man=batman
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

alias pym="python -m"
alias jl="jupyter lab --browser='open -a \"Google Chrome\" %s'"
alias pn=pnpm
alias jq=jaq
alias mk=minikube
alias mba="mamba activate"
alias mbd="mamba deactivate"
alias atd="atuin search --exclude-exit 0 --delete-it-all"

alias chz=chezmoi
alias chza="chezmoi apply"
alias chzs="chezmoi status"
alias chzd="chezmoi diff"

eval "$(gh copilot alias -- zsh)"
