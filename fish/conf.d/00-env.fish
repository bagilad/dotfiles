#
# env - Set environment vars.
#

# Set XDG basedirs.
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -q XDG_CONFIG_HOME; or set -Ux XDG_CONFIG_HOME $HOME/.config
set -q XDG_DATA_HOME; or set -Ux XDG_DATA_HOME $HOME/.local/share
set -q XDG_STATE_HOME; or set -Ux XDG_STATE_HOME $HOME/.local/state
set -q XDG_CACHE_HOME; or set -Ux XDG_CACHE_HOME $HOME/.cache
mkdir -p $XDG_CONFIG_HOME $XDG_DATA_HOME $XDG_STATE_HOME $XDG_CACHE_HOME

# Fish vars
set -q __fish_cache_dir; or set -Ux __fish_cache_dir $XDG_CACHE_HOME/fish
set -q __fish_plugins_dir; or set -Ux __fish_plugins_dir $__fish_config_dir/plugins
test -d $__fish_cache_dir; or mkdir -p $__fish_cache_dir

# Set editor variables.
set -gx PAGER less
set -gx VISUAL nvim
set -gx EDITOR nvim

# Set browser on macOS.
switch (uname -s)
    case Darwin
        set -gx BROWSER open
end

# Set vars for dotfiles and special dirs.
set -g ZDOTDIR $XDG_CONFIG_HOME/zsh
set -gx DOTFILES $HOME/.dotfiles
set -gx PROJECTS_DIR $HOME/projects

# Set SDKROOT to the macOS SDK path
set -x SDKROOT (xcrun --sdk macosx --show-sdk-path)
# Set the C++ include path
set -x CPLUS_INCLUDE_PATH "$SDKROOT/usr/include/c++/v1"
# Set the compiler flags
set -x CXXFLAGS "-isysroot $SDKROOT -I$SDKROOT/usr/include -I$SDKROOT/usr/include/c++/v1"

set FZF_DEFAULT_OPTS "--layout=reverse --border=rounded --margin=3% --color=dark"
