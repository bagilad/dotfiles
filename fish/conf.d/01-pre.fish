#
# pre - First things first.
#

# Allow subdirs for functions and completions.
set fish_function_path (path resolve $__fish_config_dir/functions/*/) $fish_function_path
set fish_complete_path (path resolve $__fish_config_dir/completions/*/) $fish_complete_path

# Add bin directories to path.
fish_add_path /Applications/WezTerm.app/Contents/MacOS
fish_add_path /opt/homebrew/bin
fish_add_path ~/.local/bin
fish_add_path ~/bin

