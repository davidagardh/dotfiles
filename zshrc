# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Colors
autoload -U colors && colors

# Source global definitions
if [ -f ~/.env  ]; then
	source ~/.env
fi

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

if [ -f ~/.secrets ]; then
	source ~/.secrets
fi

setopt autocd # cd by just the name of directory

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh_history
setopt appendhistory

# auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # include hidden files

# Plugin manager Antigen
source ~/.config/zsh/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen theme romkatv/powerlevel10k

antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
