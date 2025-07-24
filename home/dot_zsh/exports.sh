#!/usr/bin/env bash

# Atuin handles history
export HISTFILE=
export SAVEHIST=0

export EDITOR="micro"
export LESSHISTFILE=-
export LESSOPEN="|$HOME/.nix-profile/bin/lesspipe.sh %s"
export HOMEBREW_CASK_OPTS="--appdir=/Applications/My"
export BUILDX_BAKE_ENTITLEMENTS_FS=0 # disable Docker buildx checks

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"

export FZF_DEFAULT_COMMAND="fd --strip-cwd-prefix --hidden --follow --color always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'fzf-preview.sh {}'"
export FZF_DEFAULT_OPTS="--ansi"

export PATH="$HOME/.local/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

CHZ_DIR=$(dirname "$(chezmoi source-path)")
export CHZ_DIR

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
