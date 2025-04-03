#!/usr/bin/env bash

ysu() {
  original="$1"
  substitute="$2"
  printf '\033[1;33mYou should use: \033[1;35m%s\033[0m\n' "$substitute"
  shift 2
  "$original" "$@"
}

alias find="ysu find fd"
alias sed="ysu sed sd"
alias grep="ysu grep rg"
alias gzip="ysu gzip zstd"
