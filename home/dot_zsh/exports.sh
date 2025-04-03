#!/usr/bin/env bash

# Atuin handles history
export HISTFILE=
export SAVEHIST=0

export EDITOR="micro"
export LESSHISTFILE=-
export GIT_LFS_SKIP_SMUDGE=1
export BUILDX_BAKE_ENTITLEMENTS_FS=0 # disable Docker buildx checks
export PYTORCH_ENABLE_MPS_FALLBACK=1
export HOMEBREW_CASK_OPTS="--appdir=/Applications/My"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export KICS_QUERIES_PATH="$HOMEBREW_PREFIX"/opt/kics/share/kics/assets/queries

CHZ_DIR=$(dirname "$(chezmoi source-path)")
export CHZ_DIR

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
