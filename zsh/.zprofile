# eval "$(/opt/homebrew/bin/brew shellenv)"
path=('/opt/homebrew/bin' $path)
export PATH
eval "$(pyenv init --path)"
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
