# davidagardh's Dotfiles

My configuration files for Linux systems.

## Installation

This repo is managed using [chezmoi](https://www.chezmoi.io/). It only depends on git being installed and can be quickly installed using this one-liner

`sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b $HOME/.local/bin init --apply davidagardh`

## Layout

| Path | Contents | Deployed by |
| --- | --- | --- |
| `home/` | chezmoi source state (see `.chezmoiroot`) | `chezmoi apply` copies it into `~` |
| `nvim/` | Neovim config | `~/.config/nvim` is a symlink to it |
| `fish/` | fish config | `~/.config/fish` is a symlink to it |
| `toolbox-ansible/` | Ansible playbook for the `toolbx` container | A weekly systemd timer from `home/dot_config/systemd` |

## Day-to-day use

- **nvim and fish** are symlinked, so edit them in place or in this repo. Anything that writes to those directories shows up in `git status`, like lazy.nvim updating `lazy-lock.json` or `funcsave` adding a function.
- **Everything else** is copied. Change it with in this repo or using `chezmoi edit <file>`. If something changed a deployed copy directly, `chezmoi apply` will warn about it. Use `chezmoi status` and `chezmoi diff` show it, and `chezmoi re-add` to pull the change back into the repo.
- **Syncing**: commit and push, then pull and `chezmoi update` on the other machines.

## Git

Shared config lives in `~/.config/git/config`. `~/.gitconfig` is machine-local: chezmoi creates it once and never touches it again. Tools that run `git config --global` (VS Code, git-lfs, `gh auth setup-git`) write there, so they can't cause sync conflicts.

## Shell

I use [fish](https://fishshell.com/) with the [starship](https://starship.rs/) prompt.

- `fish/conf.d/*.fish` runs at every startup, in alphabetical order. Use one file per topic.
- `fish/functions/<name>.fish` holds one function per file. Each one loads the first time it's called. `funced <name>` and then `funcsave <name>` writes the file for you.

bash and vim have small configs for machines that don't have fish and Neovim.

## Neovim

Nvim config based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). It uses [Lazy](https://github.com/folke/lazy.nvim) to manage plugins.

## YubiKey

[drduh YubiKey Guide](https://github.com/drduh/YubiKey-Guide/)

Setting up a new machine for SSH and gpg:

1. `ssh -K`
1. (`sudo systemtl restart pcscd`)
1. `gpg --edit-card`  
    `> fetch`
