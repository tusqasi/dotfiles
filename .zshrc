# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
# USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


source ~/.config/zsh/abbreviations.zsh
source ~/.config/zsh/zsh-fzf-history-search/zsh-fzf-history-search.zsh
# source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history)
source /usr/share/z/z.sh

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

autoload -Uz compinit
compinit

export SUDOEDIT=nvim
export EDITOR=nvim


# bun completions
# [ -s "/home/tusqasi/.bun/_bun" ] && source "/home/tusqasi/.bun/_bun"

# bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"

path+=("$HOME/.cargo/bin")
# instal quartuc
export QSYS_ROOTDIR="/home/tusqasi/intelFPGA_lite/22.1std/quartus/sopc_builder/bin"

# starship
# eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/home/tusqasi/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export FLYCTL_INSTALL="/home/tusqasi/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"


# bob
path+=("$HOME/.local/share/bob/nvim-bin")

[[ ! -r /home/tusqasi/.opam/opam-init/init.zsh ]] || source /home/tusqasi/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 2048000"
