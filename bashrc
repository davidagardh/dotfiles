# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.env  ]; then
	source ~/.env
fi

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Prompt
ATTRIBUTE_BOLD='\[\e[1m\]'
ATTRIBUTE_RESET='\[\e[0m\]'
COLOR_DEFAULT='\[\e[39m\]'
COLOR_RED='\[\e[31m\]'
COLOR_GREEN='\[\e[32m\]'
COLOR_YELLOW='\[\e[33m\]'
COLOR_BLUE='\[\e[34m\]'
COLOR_MAGENTA='\[\e[35m\]'
COLOR_CYAN='\[\e[36m\]'
COLOR_GRAY='\e[38;5;246m'

machine_name() {
    if [[ -f $HOME/.name ]]; then
        cat $HOME/.name
    else
        hostname
    fi
}

PROMPT_DIRTRIM=3
PS1="${COLOR_CYAN}\\u${COLOR_DEFAULT}${COLOR_GREEN}@${COLOR_DEFAULT}${COLOR_MAGENTA}\$(machine_name)${COLOR_DEFAULT} ${COLOR_YELLOW}\w${COLOR_DEFAULT}${COLOR_BLUE}>${COLOR_DEFAULT} "

demoprompt() {
    PROMPT_DIRTRIM=1
    PS1="${COLOR_GRAY}\w ${COLOR_BLUE}\$ "
    trap '[[ -t 1 ]] && tput sgr0' DEBUG
}
