
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/giladba/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/giladba/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/giladba/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/giladba/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export PATH="$HOME/.cargo/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/giladba/.sdkman"
[[ -s "/Users/giladba/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/giladba/.sdkman/bin/sdkman-init.sh"
