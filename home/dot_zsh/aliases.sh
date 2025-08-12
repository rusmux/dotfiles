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

alias ls="eza --icons auto --group-directories-first --ignore-glob '.DS_Store|.localized'"
alias lsa="ls -A"
alias lsl="ls -Al"
alias tree="lsa -TL 2 -I '.DS_Store|.git|.idea'"
alias wget="wget --hsts-file=/dev/null"
alias ps="procs --tree"
alias jq=jaq
alias watch="viddy -d --shell=zsh --disable_auto_save"
alias diff=delta
alias fzf="fzf --preview 'fzf-preview.sh {}'"

alias cat=bat
alias man=batman
# alias -g -- -h="-h 2>&1 | bat -l=help -p"
alias -g -- -help="-help 2>&1 | bat -l=help -p"
alias -g -- --help="--help 2>&1 | bat -l=help -p"

alias pym="python -m"
alias pn=pnpm
alias mk=minikube
alias atd="atuin search --exclude-exit 0 --delete-it-all"
alias rclone='rclone -P --check-first --exclude-from "$HOME/.config/rclone/ignore"'
alias yaegi="rlwrap yaegi"

alias goci="golangci-lint"
alias gocif="golangci-lint fmt"
alias gocir="golangci-lint run"
alias gorl="goreleaser"

alias chz=chezmoi
alias chzs="chezmoi status"
alias chzd="chezmoi diff -r"
alias chza="chezmoi apply"

# cannot copy ugrep as ~/.local/bin/grep because it breaks some tools that expect GNU grep
alias grep="ug -G"
alias egrep="ug -E"  # search with extended regular expressions (ERE) like egrep
alias fgrep="ug -F"  # find string(s) like fgrep
alias zgrep="ug -zG" # search compressed files and archives with BRE
alias zegrep="ug -zE"
alias zfgrep="ug -zF"

alias cg=cargo
alias cgr="cargo run"
alias cgt="cargo test"
alias cgb="cargo build"
alias cga="cargo add"
alias cgu="cargo update"
alias cgi="cargo install"
alias cgui="cargo uninstall"

alias hm=home-manager
command -v nix &>/dev/null && current_system=$(nix eval --raw --impure --expr 'builtins.currentSystem')
# shellcheck disable=SC2139
alias hms="home-manager switch --flake $CHZ_DIR/home-manager#$USER-$current_system"
alias sdr="sudo darwin-rebuild"
alias sdrs='sudo darwin-rebuild switch --flake "$CHZ_DIR/nix-darwin"'
