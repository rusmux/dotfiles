{ pkgs }:

with pkgs;
[
  ### ? Core ###
  bash
  zsh

  uutils-coreutils-noprefix
  uutils-findutils
  uutils-diffutils
  inetutils

  ugrep
  gnugrep
  gnused
  gnutar
  gnumake
  gawk
  openssh
  openssl
  tree
  less
  lesspipe
  file
  curl
  wget
  man
  bc

  pv
  rename
  parallel
  rsync

  zip
  unzip
  gzip
  pigz
  p7zip
  zstd
  ouch

  ### ? Shell ###
  micro
  zoxide
  atuin
  starship
  chezmoi
  eza
  bat
  # bat-extras.batman # fails to build Nushell
  chafa
  glow
  delta
  viddy

  # Monitoring
  btop
  procs
  procps
  dua
  nix-tree

  # Search
  fd
  fzf
  ripgrep

  # Cheatsheets
  tealdeer
  cheat

  ### ? Misc ###
  # ookla-speedtest

  # Formats
  imagemagick

  ### ? DevOps ###
  jq
  jaq
  jnv
  jc
  yq-go

  lsof
  nmap
  netcat-gnu
  bind # DNS tools
  hostctl
  mtr
  ttl

  hyperfine
  vegeta
  gnupg
  age
  mkcert
  act
  dbmate

  minio-client

  # K8s
  kubecolor
  krew
  kubectx
  stern
  kubelogin-oidc
  kubefwd
  kubectl-neat
  kubectl-tree
  helm-docs
  sops

  ### ? Development ###
  git
  git-lfs
  git-xet
  gh
  glab

  mise
  pixi
  uv
  just
  tokei
  git-cliff
  rlwrap
  # yaegi # fails to build
  # evcxr # installs its own Rust, 2.5 GB

  # Linting and Formatting
  # pre-commit # fails to build Swift 5.10.1
  shellcheck
  shfmt
  dotenv-linter
  commitizen
  editorconfig-checker
  nil
  statix
]
