zstyle ':completion:*' completer _complete _correct _approximate 

autoload -Uz compinit
compinit
HISTFILE=~/.zsh_hist
HISTSIZE=5000
SAVEHIST=10000
setopt autocd extendedglob
unsetopt beep notify
bindkey -e
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# Keybinds #

bindkey "\e[3~" backward-delete-char
bindkey "\e[3~" backward-delete-char
bindkey ";3D" backward-word
bindkey ";3C" forward-word

# Aliases #
alias c=clear
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='exa -h'
alias lsa='exa -hal'
alias m=man
alias n="/home/tusqasi/appimages/nvim_nightly.appimage"
alias nal='/home/tusqasi/appimages/nvim_nightly.appimage /home/tusqasi/.config/alacritty/alacritty.yml'
alias nn='/home/tusqasi/appimages/nvim_nightly.appimage /home/tusqasi/.config/nvim/'
alias nvim="/home/tusqasi/appimages/nvim_nightly.appimage"
alias p='ping google.com'
alias pacs='sudo pacman -S'
alias pacy='sudo pacman -Syu'
alias pin=paru\ -Sl\|\ fzf\ --multi\ --preview\ \'paru\ -Si\ \{2\}\'\ \|\ cut\ -d\'\ \'\ -f\ 2\|xargs\ -ro\ paru
alias v.='vifm ./'
alias q=exit
# Only for zsh# 
alias nz="~/appimages/nvim_nightly.appimage ~/.zshrc"
alias soz="source ~/.zshrc"

# Prompt # 
# source ~/clones/geometry-zsh/geometry.zsh
fpath+=~/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# Plugins # 

# z
source ~/.zsh/zsh-z/zsh-z.plugin.zsh
# Fish like hist based suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

