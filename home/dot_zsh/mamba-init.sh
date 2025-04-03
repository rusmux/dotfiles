#!/usr/bin/env bash
# shellcheck disable=SC2181,SC1091
# allow $?, ignore `Not following` error

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
export MAMBA_EXE="$HOMEBREW_PREFIX/Caskroom/miniforge/base/bin/mamba"
export MAMBA_ROOT_PREFIX="$HOMEBREW_PREFIX/Caskroom/miniforge/base"
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__mamba_setup"
else
  # shellcheck disable=SC2139
  alias mamba="$MAMBA_EXE" # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOMEBREW_PREFIX"/Caskroom/miniforge/base/bin/conda 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "$HOMEBREW_PREFIX/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
    . "$HOMEBREW_PREFIX/Caskroom/miniforge/base/etc/profile.d/conda.sh"
  else
    export PATH="$HOMEBREW_PREFIX/Caskroom/miniforge/base/bin:$PATH"
  fi
fi
unset __conda_setup

if [ -f "$HOMEBREW_PREFIX/Caskroom/miniforge/base/etc/profile.d/mamba.sh" ]; then
  . "$HOMEBREW_PREFIX/Caskroom/miniforge/base/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
