# paths

set -x PATH $PATH ~/.config/rofi/bin
set -x PATH $PATH ~/Downloads/node-v12.16.3-linux-x64/bin
set -x PATH $PATH ~/gems/bin
set -x PATH $PATH ~/.gem/ruby/2.7.0/bin
set -x PATH $PATH ~/.cargo/bin
set -x PATH $PATH ~/Downloads/chromewebdriver_linux64/
set -x PATH $PATH ~/clones/flutter/bin
set -x PATH $PATH ~/clones/android-studio/bin/
set -x PATH $PATH ~/Downloads/vb_phone_stuff/platform-tools/

# ENV variables

set -e EDITOR
set EDITOR /usr/bin/nvim
set GEM_HOME ~/gems
set webs ~/Documents/websites
set pyst ~/Documents/python_stuff/

# No greeting 
set fish_greeting  

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

function tmx -d "warp tmux"
    if not tmux a
	tmux 
    end
end

	

