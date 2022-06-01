fish_ssh_agent
ssh-add -q ~/.ssh/new_key

# No greeting setting
set fish_greeting
set fish_command_not_found

source /opt/asdf-vm/asdf.fish
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
direnv hook fish | source
