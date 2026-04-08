#!/bin/sh

if [ -z "${CHEZMOI_SKIP_DECRYPT}" ] && [ ! -f "${HOME}/.config/chezmoi/key.txt" ]; then
  mkdir -p "${HOME}/.config/chezmoi"
  chezmoi age decrypt --output "${HOME}/.config/chezmoi/key.txt" --passphrase "${HOME}/.local/share/chezmoi/key.txt.age"
  chmod 600 "${HOME}/.config/chezmoi/key.txt"
fi
