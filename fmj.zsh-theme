# fmj.zsh-theme
# based on af-magic

local return_code="%(?..%{$fg[red]%}%? ↵ %{$reset_color%})"

time_info () {
  date +%H:%M:%S
}

# primary prompt
PROMPT='$FG[237]${(l.COLUMNS..-.)}%{$reset_color%}
$FG[032]%~\
 $(git_prompt_info) \
$return_code\
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

# color vars
eval my_orange='$FG[214]'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# right prompt
RPROMPT='$(time_info) %{$reset_color%}%'

