set -q MY_ABBRS_INITIALIZED; and return

abbr -a -- - 'cd -'
abbr -a -- vi nvim
abbr -a -- vim nvim
abbr -a -- tarls 'tar -tvf'
abbr -a -- untar 'tar -xv'
abbr -a -- md 'mkdir -p'

abbr -a -- c clear
abbr -a -- h history

# quick nav
abbr -a -- fconf 'cd $__fish_config_dir'
abbr -a -- fishconf 'cd $__fish_config_dir'
abbr -a -- fdot 'cd $__fish_config_dir'

# date/time
abbr -a -- ds 'date +%Y-%m-%d'
abbr -a -- ts 'date +%Y-%m-%dT%H:%M:%SZ'
abbr -a -- yyyymmdd 'date +%Y%m%d'

# no need to run over-and-over
set -g MY_ABBRS_INITIALIZED true
