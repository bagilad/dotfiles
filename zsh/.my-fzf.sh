# see:
# https://bluz71.github.io/2018/11/26/fuzzy-finding-in-bash-with-fzf.html

export FZF_DEFAULT_COMMAND='fd --type f --color=never'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d . --color=never'
export FZF_DEFAULT_OPTS='
  --height 75% --multi --reverse
  --bind ctrl-f:page-down,ctrl-b:page-up
'

fzf_find_edit() {
    local file=$(
      fzf --no-multi --preview 'bat --color=always --line-range :500 {}'
      )
    if [[ -n $file ]]; then
        $EDITOR $file
    fi
}

fzf_grep_edit(){
    if [[ $# == 0 ]]; then
        echo 'Error: search term was not provided.'
        return
    fi
    local match=$(
      rg --color=never --line-number "$1" |
        fzf --no-multi --delimiter : \
            --preview "bat --color=always --line-range {2}: {1}"
      )
    local file=$(echo "$match" | cut -d':' -f1)
    if [[ -n $file ]]; then
        $EDITOR $file +$(echo "$match" | cut -d':' -f2)
    fi
}

fzf_kill() {
    local pids=$(
      ps -f -u $USER | sed 1d | fzf --multi | tr -s [:blank:] | cut -d' ' -f2
      )
    if [[ -n $pids ]]; then
        echo "$pids" | xargs kill -9 "$@"
    fi
}

fzf_git_add() {
    local files=$(git ls-files --modified | fzf --ansi)
    if [[ -n $files ]]; then
        git add --verbose $files
    fi
}

fzf_git_log() {
    local commits=$(
      git ll --color=always "$@" |
        fzf --ansi --no-sort --height 100% \
            --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                       xargs -I@ sh -c 'git show --color=always @'"
      )
    if [[ -n $commits ]]; then
        local hashes=$(printf "$commits" | cut -d' ' -f2 | tr '\n' ' ')
        git show $hashes
    fi
}

fzf_git_reflog() {
    local hash=$(
      git reflog --color=always "$@" |
        fzf --no-multi --ansi --no-sort --height 100% \
            --preview "git show --color=always {1}"
      )
    echo $hash
}

fzf_git_log_pickaxe() {
     if [[ $# == 0 ]]; then
         echo 'Error: search term was not provided.'
         return
     fi
     local commits=$(
       git log --oneline --color=always -S "$@" |
         fzf --ansi --no-sort --height 100% \
             --preview "git show --color=always {1}"
       )
     if [[ -n $commits ]]; then
         local hashes=$(printf "$commits" | cut -d' ' -f1 | tr '\n' ' ')
         git show $hashes
     fi
 }

alias ffe='fzf_find_edit'
alias fge='fzf_grep_edit'
alias fkill='fzf_kill'
alias gadd='fzf_git_add'
alias gll='fzf_git_log'
alias grl='fzf_git_reflog'
alias glS='fzf_git_log_pickaxe'
