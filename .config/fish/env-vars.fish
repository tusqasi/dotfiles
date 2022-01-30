set -e  EDITOR
set -gx EDITOR        "/usr/local/bin/nvim"
set -gx SUDO_EDITOR   "/usr/local/bin/nvim"
set -g  NVIM_DIR      "$HOME/.config/nvim"
set -x  MANPAGER      "sh -c 'col -bx | bat -l man -p'"
set -x  DENO_INSTALL  "$HOME/.config/deno"
set -x  GOPATH        "$HOME/.local/share/go/"
set -x  WAKATIME_HOME "$HOME/.config/wakatime/"
set -x  FLUTTER_HOME  "/opt/flutter"
