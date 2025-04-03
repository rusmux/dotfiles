#!/usr/bin/env bash

# Git
git() {
  echo "+ git $*" >&2
  command git "$@"
}

# Docker
docker() {
  echo "+ docker $*" >&2
  if [[ $1 == ps ]]; then
    shift
    command dops "$@"
  else
    command docker "$@"
  fi
}

alias dpsaw="watch dops --color true -a"
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
cd() {
  echo "use 'z'"
  return 1
}

alias ls="eza --icons auto --group-directories-first"
alias lsa="ls -A"
alias lsl="ls -Al"
alias tree="lsa -TL 2 -I '.DS_Store|.git|.idea'"
alias ps="procs --tree"
alias jq=jaq
alias watch="viddy -d --shell=zsh --disable_auto_save"
alias diff=delta
alias fzf="fzf --preview 'fzf-preview.sh {}'"

alias cat=bat
alias man=batman
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

alias pym="python -m"
alias pn=pnpm
alias mk=minikube
alias atd="atuin search --exclude-exit 0 --delete-it-all"

alias chz=chezmoi
alias chzs="chezmoi status"
alias chzd="chezmoi diff -r"
alias chza="chezmoi apply"

eval "$(gh copilot alias -- zsh)"
