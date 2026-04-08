#
# Environment
#
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

export PAGER=less
export VISUAL=nvim
export EDITOR=nvim
[[ "$OSTYPE" == darwin* ]] && export BROWSER=open

export DOTFILES="$HOME/.dotfiles"
export PROJECTS_DIR="$HOME/projects"

export FZF_DEFAULT_OPTS="--layout=reverse --border=rounded --margin=3% --color=dark"

#
# History
#
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS  # remove older duplicate when new one is added
setopt HIST_SAVE_NO_DUPS     # don't write duplicates to file
setopt HIST_FIND_NO_DUPS     # don't show duplicates when searching
setopt HIST_IGNORE_SPACE     # don't record commands starting with space
setopt HIST_REDUCE_BLANKS    # remove extra blanks
setopt SHARE_HISTORY         # share history between sessions
setopt EXTENDED_HISTORY      # save timestamp with each command

# Fix backspace and delete keys
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

#
# PATH
#
typeset -U path
path=(
    /Applications/WezTerm.app/Contents/MacOS
    /opt/homebrew/bin
    ~/.local/bin
    ~/bin
    ~/.config/emacs/bin
    ~/.antigravity/antigravity/bin
    $path
)

#
# Aliases
#
alias ..='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -- -='cd -'
alias v=nvim
alias vi=nvim
alias vim=nvim
alias tarls='tar -tvf'
alias untar='tar -xv'
alias md='mkdir -p'
alias c=clear
alias h=history
alias venv='python -m venv .venv --prompt .'
alias zconf='$EDITOR ~/.zshrc'
alias ds='date +%Y-%m-%d'
alias ts='date +%Y-%m-%dT%H:%M:%SZ'
alias yyyymmdd='date +%Y%m%d'
function fhist() {
    local cmd=$(grep '^- cmd:' ~/.local/share/fish/fish_history | sed 's/^- cmd: //' | tail -r | fzf --no-sort)
    [[ -n "$cmd" ]] && print -z "$cmd"
}

#
# Tool initialization
#
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

command -v fzf &>/dev/null && source <(fzf --zsh)
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
command -v fnm &>/dev/null && eval "$(fnm env --use-on-cd --shell zsh)"
command -v starship &>/dev/null && eval "$(starship init zsh)"
