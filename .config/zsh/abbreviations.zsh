# Config management
alias cfg="/usr/bin/git --git-dir=/home/tusqasi/.cfg/ --work-tree=/home/tusqasi"
alias cfgg="/usr/bin/git --git-dir=/home/tusqasi/.cfg/ --work-tree=/home/tusqasi gui"
alias cfgp="/usr/bin/git --git-dir=/home/tusqasi/.cfg/ --work-tree=/home/tusqasi push"
alias config="/usr/bin/git --git-dir=/home/tusqasi/.cfg/ --work-tree=/home/tusqasi"
alias e="~/scripts/edit_configs.sh"
alias gg="git gui"

# Package manager
alias rmp="sudo pacman -R"
alias inst="sudo pacman -Syu"

# Utils
alias cp="cp -i"
alias df="df -h"
alias l="exa --icons"
alias la="exa -hla --icons"
alias mkdir="mkdir -pv"
alias mv="mv -i"
alias rm="rm -I --preserve-root"
alias rs="rsync -azvhprP"
alias wget="wget -c"

# Shorthand
alias c="clear"
alias n="nvim"
alias p="ping google.com"
alias q="exit"
alias s="sudo"
alias sn="sudoedit"
alias v="vifm ./"


# Neovim
alias nup="z neovim;git checkout master;git pull --all;sudo make install CMAKE_BUILD_TYPE=Release;cd -"

# Elixir
alias ism="iex -S mix"
