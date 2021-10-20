# ENV variables
source ~/.config/fish/env-vars.fish
# set -Ux TERM xterm-256color

# Paths
source ~/.config/fish/paths.fish
# Aliases
source ~/.config/fish/abbrs.fish
abbr -a -U -- e '~/scripts/edit_configs.sh'

fish_ssh_agent
ssh-add -q ~/.ssh/new_key
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

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

