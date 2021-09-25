HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt autocd extendedglob
unsetopt beep
bindkey -e
zstyle :compinstall filename "~/.zshrc"
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^W" vi-backward-kill-word

arch=$(uname -m)
kernel=$(uname -r)
if [ -n "$(command -v lsb_release)" ]; then
	distroname=$(lsb_release -s -d)
elif [ -f "/etc/os-release" ]; then
	distroname=$(grep PRETTY_NAME /etc/os-release | sed 's/PRETTY_NAME=//g' | tr -d '="')
elif [ -f "/etc/debian_version" ]; then
	distroname="Debian $(cat /etc/debian_version)"
else
	distroname="$(uname -s) $(uname -r)"
fi

# start zoxide
eval "$(zoxide init zsh)"
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
# source ~/.zsh/prompt.zsh # my prompt
source ~/.zsh/env.zsh
source ~/.zsh/ssh-agent.zsh
source ~/.zsh/paths.zsh
source ~/.zsh/expand-ealias.plugin.zsh
source ~/.zsh/zsh_alias.zsh
source ~/.zsh/zsh-autoswitch-virtualenv/autoswitch_virtualenv.plugin.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

source ~/.config/broot/launcher/bash/br

ssh-add -q ~/.ssh/new_key
fpath+=${ZDOTDIR:-~}/.zsh_functions
