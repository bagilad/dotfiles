#
# pre - First things first.
#
# Allow subdirs for functions and completions.
if set -l func_dirs (path resolve $__fish_config_dir/functions/*/ 2>/dev/null)
    set fish_function_path $func_dirs $fish_function_path
end
if set -l comp_dirs (path resolve $__fish_config_dir/completions/*/ 2>/dev/null)
    set fish_complete_path $comp_dirs $fish_complete_path
end

# Add bin directories to path.
fish_add_path /Applications/WezTerm.app/Contents/MacOS
fish_add_path /opt/homebrew/bin
fish_add_path ~/.local/bin
fish_add_path ~/bin
