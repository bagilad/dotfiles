# ~/.config/fish/conf.d runs first

# https://fishshell.com/docs/current/tutorial.html
# https://github.com/jorgebucaran/fish-shell-cookbook
# https://github.com/fish-shell/fish-shell/blob/master/share/config.fish
# https://github.com/fish-shell/fish-shell/blob/da32b6c172dcfe54c9dc4f19e46f35680fc8a91a/share/config.fish#L257-L269

set fish_greeting

# Set up fzf key bindings
type -q fzf; and fzf --fish | source

type -q zoxide; and zoxide init fish | source
type -q starship; and starship init fish | source

# Added by Antigravity
fish_add_path /Users/gilad/.antigravity/antigravity/bin
