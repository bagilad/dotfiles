# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  cp
  git
  docker
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

alias c="clear"
export VISUAL="emacsclient -c"
export EDITOR="$VISUAL"
alias vi=nvim
alias vim=nvim
alias ec="emacsclient -c -n"
alias spark-shell='spark-shell --conf spark.driver.extraJavaOptions="-Dscala.color"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.my-fzf.sh ] && source ~/.my-fzf.sh

#export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#bind -x '"\C-p": vim $(fzf);'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/giladba/.sdkman"
[[ -s "/Users/giladba/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/giladba/.sdkman/bin/sdkman-init.sh"

alias ssh="/Users/giladba/.af-ssh/update.sh; ssh $@"

alias af-scp="/Users/giladba/.af-ssh/af_scp.sh $@"
