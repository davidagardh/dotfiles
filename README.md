# the0val's Dotfiles

My configuration files for Linux systems.

## Installation

This repo is managed using [chezmoi](https://www.chezmoi.io/). It only depends on git being installed and can be quickly installed using this one-liner

`sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply the0val`

## ZSH

I use Oh-my-zsh with a few plugins enabled. The theme is [p10k](https://github.com/romkatv/powerlevel10k).

## Neovim

I use [packer.nvim](https://github.com/wbthomason/packer.nvim) to manage neovim plugins. Packer is not included in this repo. It needs to be installed manually:

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
