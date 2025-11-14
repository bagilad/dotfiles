set -l uv_env "$HOME/.local/share/../bin/env.fish"
if test -f $uv_env
    source $uv_env
end
