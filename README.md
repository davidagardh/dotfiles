# davidagardh's Dotfiles

My configuration files for Linux systems.

## Installation

This repo is managed using [chezmoi](https://www.chezmoi.io/). It only depends on git being installed and can be quickly installed using this one-liner

`sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b $HOME/.local/bin init --apply davidagardh`

## Shell

I use [fish](https://fishshell.com/) with the [tide prompt](https://github.com/IlanCosman/tide).

## Neovim

Nvim config based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). It uses [Lazy](https://github.com/folke/lazy.nvim) to manage plugins.

## YubiKey

[drduh YubiKey Guide](https://github.com/drduh/YubiKey-Guide/)

Setting up a new machine for SSH and gpg:

1. `ssh -K`
1. (`sudo systemtl restart pcscd`)
1. `gpg --edit-card`  
    `> fetch`

