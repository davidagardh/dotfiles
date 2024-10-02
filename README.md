# the0val's Dotfiles

My configuration files for Linux systems.

## Installation

This repo is managed using [chezmoi](https://www.chezmoi.io/). It only depends on git being installed and can be quickly installed using this one-liner

`sh -c "$(curl -fsLS https://chezmoi.io/get)" -- -b $HOME/.local/bin init --apply the0val`

## ZSH

I use Oh-my-zsh with a few plugins enabled. The theme is [p10k](https://github.com/romkatv/powerlevel10k).

## Neovim

Nvim config based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). It uses [Lazy](https://github.com/folke/lazy.nvim) to manage plugins.
