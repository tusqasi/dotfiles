set -e EDITOR
set -gx EDITOR /usr/bin/nvim
set -gx SUDO_EDITOR /usr/bin/nvim
set -g NVIM_DIR ~/.config/nvim/
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x DENO_INSTALL "/home/tusqasi/.deno"

nvm use --lts --silent
