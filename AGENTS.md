# Project Overview

Personal dotfiles repository for macOS (aarch64-darwin) and Linux environments, managed with **Chezmoi**. Three configuration layers work together:

- **Chezmoi** (`home/`) — dotfile templates, encryption (age), external files
- **Home Manager** (`home-manager/`) — user-level Nix packages and config
- **nix-darwin** (`nix-darwin/`) — system-level macOS configuration (Homebrew, defaults)

The Chezmoi source root is `home/` (set in `.chezmoiroot`), so all managed dotfiles live there using Chezmoi naming conventions (`dot_`, `private_`, `executable_`, `.tmpl`).

## Common Commands

```bash
# Chezmoi
chezmoi diff -r                  # Preview changes before applying
chezmoi apply                    # Apply dotfiles to home directory
chezmoi status                   # Check which files differ

# Home Manager (user-level packages)
nix run home-manager/master -- switch --flake "$CHZ_DIR/home-manager#$USER-aarch64-darwin"

# nix-darwin (system-level macOS)
sudo darwin-rebuild switch --flake "$CHZ_DIR/nix-darwin"

# Pre-commit (linting/formatting)
prek run --all-files       # Run all hooks
prek run <hook-id>         # Run a single hook (e.g. shellcheck, shfmt, yamllint)
```

## Architecture

```
nix-darwin/          System config: Homebrew casks/formulae, macOS defaults, Nix settings
home-manager/        User config: 143+ Nix packages (base.nix), optional DevOps tools (extra.nix)
home/                Chezmoi source root — maps to ~/
  dot_config/        App configs: starship, wezterm, yazi, gh, mise
  dot_local/bin/     Local scripts (fzf-preview, mk-start CLI generator)
  dot_zsh/           Zsh config: .zshrc, aliases.sh, exports.sh
  private_*/         Encrypted/private files (SSH keys, Documents, Library)
  .chezmoiexternal.toml  External deps: OhMyZsh, Yazi plugins, kubectl aliases
scripts/             Setup scripts: macos-setup.sh, privacy hardening, Swift spelling checker
```

## Key Conventions

- **Language runtimes**: Managed by `mise` (Go, Rust, Python 3.12, Node, Bun, etc.)
- **Nix packages**: Add to `home-manager/packages/base.nix` (core) or `extra.nix` (optional)
- **Homebrew apps**: Add to `nix-darwin/homebrew.nix`
