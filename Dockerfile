# hadolint ignore=DL3007
FROM ubuntu:latest

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008,DL3015
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  apt-get update \
  && apt-get dist-upgrade -y \
  && apt-get install -y curl

RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
  --extra-conf "sandbox = false" \
  # https://github.com/DeterminateSystems/nix-installer/issues/324
  --extra-conf "filter-syscalls = false" \
  --init none \
  --no-confirm

ENV PATH="$PATH:/nix/var/nix/profiles/default/bin" \
  USER=root
ARG COMMIT_HASH_NIX=main
RUN nix run home-manager/master -- switch \
  --flake "github:rusmux/dotfiles/$COMMIT_HASH_NIX?dir=home-manager#$USER-$(nix eval --raw --impure --expr 'builtins.currentSystem')"

RUN echo "$HOME/.nix-profile/bin/zsh" | tee -a /etc/shells \
  && chsh -s "$HOME/.nix-profile/bin/zsh"

RUN mkdir -p "$HOME/.config/mise" \
  && curl -sSf -L https://raw.githubusercontent.com/rusmux/dotfiles/refs/heads/main/home/dot_config/mise/config.toml -o "$HOME/.config/mise/config.toml" \
  && mise install helm kubectl python github:Mikescher/better-docker-ps

RUN CHEZMOI_SKIP_DECRYPT=1 chezmoi init --apply --exclude encrypted rusmux

ENTRYPOINT [ "zsh" ]
