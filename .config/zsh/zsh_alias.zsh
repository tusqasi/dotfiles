if [[ $distroname =~ "buntu" ]]; then
    ealias inst="sudo apt install" 
    ealias update="sudo apt update; sudo apt upgrade"
    ealias pkq="sudo apt list| grep"
else
    ealias pacr='sudo pacman -R'
    ealias inst='sudo pacman -S'
    ealias update='sudo pacman -Syu'
fi
ealias _="sudo "

ealias c="clear"

ealias q="exit"
ealias sz="source ~/.zshrc"

ealias s="sudo"

ealias l="exa --icons -1"
ealias la="exa --icons -lah"
ealias ls="exa --icons -1"

ealias md="mkdir -p"

ealias v="vifm"
ealias v.="vifm ."

ealias py="python"

ealias e="~/scripts/edit_configs.sh"
ealias nz="~/scripts/zsh_config.sh"
ealias na="nvim ~/.zsh/zsh_alias.zsh"
ealias n="nvim"
ealias nn="~/scripts/nvim_configs.sh"
ealias nq="~/scripts/qtile_config.sh"
ealias sn="sudoedit"

ealias config="/usr/bin/git --git-dir=/home/tusqasi/.cfg/ --work-tree=/home/tusqasi"

function mc(){
    mkdir -p $1;
    cd $1;
}
