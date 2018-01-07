local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

# PROMPT='$ret_status %{$fg[cyan]%}$(get_pwd) $(git_prompt_status)%{$reset_color%}%{$reset_color%}'
PROMPT='$ret_status $(get_pwd) $(git_prompt_status)%{$reset_color%}%{$reset_color%}'
RPROMPT='$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✗ %{$reset_color%}   "
ZSH_THEME_GIT_PROMPT_CLEAN="      "

local git_modified="%{$fg_bold[yellow]%}⚑ "

# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%}◒ "
# ZSH_THEME_GIT_PROMPT_UNTRACKED="$git_modified"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✓ "

ZSH_THEME_GIT_PROMPT_MODIFIED="$git_modified"

# ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
# ZSH_THEME_GIT_PROMPT_DELETED="$git_modified"

# ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}➜  "
# ZSH_THEME_GIT_PROMPT_RENAMED="$git_modified"

ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[magenta]%}▼ "
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[blue]%}▲ "

function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir="%{$fg[cyan]%}%~"
  else
    parent=${git_root%\/*}
    prompt_short_dir="%{$fg[magenta]%}${PWD#$parent/} >"
  fi
  echo $prompt_short_dir
}
