{ pkgs }:

with pkgs;
[
  ### ? Core ###
  bash
  zsh

  uutils-coreutils-noprefix
  uutils-findutils
  uutils-diffutils # provides only `diffutils`
  diffutils
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
  bat-extras.batman
  chafa
  glow
  delta
  viddy

  # Monitoring
  btop
  procs
  procps
  dua

  # Search
  fd
  fzf
  ripgrep-all
  yazi

  # Cheatsheets
  tealdeer
  cheat

  ### ? Misc ###
  jackett
  yt-dlp
  ookla-speedtest

  # Formats
  ffmpeg
  imagemagick
  pandoc
  poppler

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

  hyperfine
  vegeta
  age
  mkcert
  act
  gitlab-ci-local

  awscli2
  minio-client
  rclone

  # K8s
  kubecolor
  krew
  kubectx
  stern
  kubelogin-oidc
  kubefwd
  kubectl-neat
  kubectl-tree
  kn
  k9s
  helmfile
  helm-docs
  argocd
  sops
  minikube
  # vault
  vcluster

  # K8s Linters
  kube-linter
  kube-score
  kubeconform
  kubent
  kics
  kubescape
  chart-testing
  popeye
  checkov
  operator-sdk
  pluto
  nova
  kubernetes-polaris

  ### ? Development ###
  git
  git-lfs
  gh
  glab
  jujutsu

  mise
  uv
  bun
  just
  tokei
  git-cliff
  exercism
  yaegi
  bashly

  plantuml-c4

  # Linting and Formatting
  pre-commit
  shellcheck
  shfmt
  dotenv-linter
  commitizen
  editorconfig-checker
  hadolint
  bats
  nil
  statix
]
