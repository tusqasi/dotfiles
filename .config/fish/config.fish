
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


abbr -a config '/usr/bin/git --git-dir=/home/tusqasi/.cfg/ --work-tree=/home/tusqasi'
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
