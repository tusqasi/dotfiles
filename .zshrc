HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt autocd extendedglob
# setopt completealiases
unsetopt beep
bindkey -e
zstyle :compinstall filename "/home/tusqasi/.zshrc"
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^W" vi-backward-kill-word
bindkey ";3C" forward-word
bindkey ";3D" backward-word
# start zoxide
eval "$(zoxide init zsh)"
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
# source /home/tusqasi/.zsh/prompt.zsh # my prompt
source /home/tusqasi/.zsh/ssh-agent.zsh
source /home/tusqasi/.zsh/paths.zsh
source /home/tusqasi/.zsh/expand-ealias.plugin.zsh
source /home/tusqasi/.zsh/zsh_alias.zsh
source /home/tusqasi/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source /home/tusqasi/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/tusqasi/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

