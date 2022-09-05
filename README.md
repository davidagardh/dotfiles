# the0val's Dotfiles

My configuration files for Linux systems.

## Installation

This repo is managed using [chezmoi](https://www.chezmoi.io/). It only depends on git being installed and can be quickly installed using this one-liner

`sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply`

## ZSH

I use Oh-my-zsh with a few plugins enabled. The theme is [p10k](https://github.com/romkatv/powerlevel10k).

## Neovim

I use the [vim-plug](https://github.com/junegunn/vim-plug) plugin manager. This means you need to install vim-plug before the config files will work:

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
