
# paths
set -x PATH $PATH ~/bin/
set -x PATH $PATH ~/scripts/
set -x PATH $PATH ~/.local/bin/

# ENV variables
source ~/.config/fish/env-vars.fish
set -e EDITOR
set EDITOR /usr/bin/nvim
set NVIM_DIR ~/.config/nvim/
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
# set -Ux TERM xterm-256color


# Aliases
abbr -a config '/usr/bin/git --git-dir=/home/tusqasi/.cfg/ --work-tree=/home/tusqasi'

abbr -a -U -- s "sudo"  
abbr -a -U -- c clear
abbr -a -U -- q exit

abbr -a -U -- n nvim
abbr -a -U -- sn 'sudo nvim'
abbr -a -U -- nf 'nvim /home/tusqasi/.config/fish/config.fish'
abbr -a -U -- nn 'nvim /home/tusqasi/.config/nvim/init.vim'
abbr -a -U -- nq 'nvim /home/tusqasi/.config/qtile/'

abbr -a -U -- pacs 'sudo pacman -S'

abbr -a -U -- l 'exa -h --icons'
abbr -a -U -- la 'exa -lha --icons'
# No greeting setting
set fish_greeting 
set fish_command_not_found

# start starship prompt
# starship init fish | source


# Helper functions
function mc -d "Create a directory and set CWD"
    mkdir -pv $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end


function envsource -d "Source the requisite env"
    source ./$argv/bin/activate.fish;
end

function pacq -d "Search in isntalled pacman packages"
    sudo pacman -Q |grep $argv
end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

