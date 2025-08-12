#!/usr/bin/env bash

# Atuin handles history
export HISTFILE=
export SAVEHIST=0

export LESSHISTFILE=-
export LESSOPEN="|lesspipe.sh %s"
export HOMEBREW_CASK_OPTS="--appdir=/Applications/My"
export BUILDX_BAKE_ENTITLEMENTS_FS=0 # disable Docker buildx checks

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgreprc"

export BAT_STYLE="auto,-grid,-numbers"
# export BAT_THEME="OneHalfDark"
export BAT_THEME="OneHalfLight"

export FZF_DEFAULT_COMMAND="fd --strip-cwd-prefix --hidden --follow --color always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'fzf-preview.sh {}'"
export FZF_THEME="--color=bg+:#CCD0DA,bg:#EFF1F5,spinner:#DC8A78,hl:#D20F39 \
--color=fg:#4C4F69,header:#D20F39,info:#8839EF,pointer:#DC8A78 \
--color=marker:#7287FD,fg+:#4C4F69,prompt:#8839EF,hl+:#D20F39 \
--color=selected-bg:#BCC0CC \
--color=border:#9CA0B0,label:#4C4F69"
export FZF_DEFAULT_OPTS="--ansi --cycle $FZF_THEME"

CHZ_DIR=$(dirname "$(chezmoi source-path)")
export CHZ_DIR
