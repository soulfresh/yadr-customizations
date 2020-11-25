# Use SilverSearcher, search dot files except for those in the git directory.
export FZF_DEFAULT_COMMAND='ag --hidden --ignore-dir .git --ignore-dir .hg -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# shellcheck source=/dev/null
# Pretzo does this automatically
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Github issues autocomplete
# shellcheck source=/dev/null
# source "$HOME/ghi_fzf_autocomplete.sh"
