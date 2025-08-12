{ pkgs }:

with pkgs;
[
  ### ? Shell ###
  ripgrep-all # requires ffmpeg
  yazi # requires ffmpeg

  ### ? Misc ###
  # jackett # fails to build Swift 5.10.1
  yt-dlp # 1.6 GB

  # Formats
  ffmpeg # 1 GB
  pandoc
  poppler

  ### ? DevOps ###
  gitlab-ci-local # 300 MB
  usql
  awscli2
  rclone
  devcontainer

  # K8s
  minikube
  k9s
  # vault # very slow to build
  vcluster
  helmfile
  argocd
  kn

  # K8s Linters
  kube-linter
  kube-score
  kubeconform
  kubent
  kics
  kubescape
  chart-testing # 1.6 GB
  popeye
  checkov # 2.2 GB
  operator-sdk # 500 MB
  pluto
  nova
  kubernetes-polaris

  ### ? Development ###
  github-copilot-cli
  jujutsu

  exercism
  # yaegi # fails to build
  # evcxr # installs its own Rust, 2.5 GB
  bashly # 800 MB
  codex

  plantuml-c4 # 600 MB

  # Linting and Formatting
  hadolint # 4.8 GB
  bats # 350 MB

  golangci-lint
  goreleaser
  sqlc
]
