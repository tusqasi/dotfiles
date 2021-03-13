
# paths
set -x PATH $PATH ~/.config/rofi/bin/
set -x PATH $PATH ~/gems/bin/
set -x PATH $PATH ~/.gem/ruby/2.7.0/bin/
set -x PATH $PATH ~/.cargo/bin/
set -x PATH $PATH ~/Downloads/chromewebdriver_linux64/
set -x PATH $PATH ~/clones/flutter/bin/
set -x PATH $PATH ~/go/bin/
set -x PATH $PATH ~/bin/
set -x PATH $PATH ~/scripts/

# ENV variables
set -e EDITOR
set EDITOR /usr/bin/nvim
set GEM_HOME ~/gems/
set NVIM_DIR ~/.config/nvim/
set FZF_DEFAULT_OPTS "--extended"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
# set -Ux TERM xterm-256color

# fzf key bindings
source ~/.config/fish/keys.fish

# No greeting setting
set fish_greeting 

# start starship prompt
starship init fish | source

# Helper functions
function mkcd -d "Create a directory and set CWD"
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

function rn -d "Run linked c code"
   if test -n "$argv"
       gcc ./$argv -lm
       ./a.out;
   else
       echo "No file specified"
   end
end
