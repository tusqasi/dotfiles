# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt autocd extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tusqasi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# start zoxide
eval "$(zoxide init zsh)"
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
# source /home/tusqasi/.zsh/prompt.zsh # my prompt
source /home/tusqasi/.zsh/zsh_alias.zsh
source /home/tusqasi/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source /home/tusqasi/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/tusqasi/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
