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
  poetry
  docker
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# see https://github.com/ohmyzsh/ohmyzsh/issues/6835
# ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

export VIMCONFIG="$HOME/.config/nvim"

export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

eval "$(rbenv init - zsh)"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@3)"

alias c="clear"
export VISUAL="nvim"
export EDITOR="$VISUAL"
alias vi=nvim
alias vim=nvim
alias ec="emacsclient -c -n"
alias spark-shell='spark-shell --conf spark.driver.extraJavaOptions="-Dscala.color"'
alias brew86='arch --x86_64 /usr/local/Homebrew/bin/brew'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.my-fzf.sh ] && source ~/.my-fzf.sh

#export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#bind -x '"\C-p": vim $(fzf);'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/gilad/.sdkman"
[[ -s "/Users/gilad/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/gilad/.sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
