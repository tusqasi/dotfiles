# paths

set -x PATH $PATH ~/.config/rofi/bin
set -x PATH $PATH ~/Downloads/node-v12.16.3-linux-x64/bin
set -x PATH $PATH ~/gems/bin
set -x PATH $PATH ~/.gem/ruby/2.7.0/bin
set -x PATH $PATH ~/.cargo/bin
set -x PATH $PATH ~/Downloads/chromewebdriver_linux64/
set -x PATH $PATH ~/clones/flutter/bin
set -x PATH $PATH ~/clones/android-studio/bin/

# ENV variables

set -e EDITOR
set EDITOR /usr/bin/nvim
set GEM_HOME ~/gems
set webs ~/Documents/websites
set pyst ~/Documents/python_stuff/
set FZF_DEFAULT_OPTS "--extended"
set MANPAGER nvim
source ~/.config/fish/keys.fish 
# No greeting setting
set fish_greeting  


# Helper functions

function mkcd -d "Create a directory and set CWD"
    mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end

function tmx -d "Warp Tmux in a more useful way"
    if not tmux a
	tmux 
    end
end

function q -d "Warpper for exit in different situtation"
    if test -n "$TMUX"
	echo 'Yo in teakmcs'
    else 
	exit
    end 
end
