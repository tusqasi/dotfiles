
# paths
set -x PATH $PATH ~/bin/
set -x PATH $PATH ~/scripts/

# ENV variables
source ~/.config/fish/env-vars.fish
# set -Ux TERM xterm-256color


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

function q -d "Warpper for exit in different situtation"
    if test -n "$TMUX"
	echo 'Yo in teakmcs'
    else
	exit
    end
end

function envsource -d "Source the requisite env"
    source ./$argv/bin/activate.fish;
end

