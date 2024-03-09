# vim:ft=zsh ts=2 sw=2 sts=2

# Must use Powerline font, for \uE0A0 to render.
# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[33]%} ●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""


username() {
   echo "%{$FG[013]%}%n%{$reset_color%}"
}

# current directory, two levels deep
directory() {
   echo "%2~"
}

# current time with milliseconds
current_time() {
   echo "%*"
}

# returns 👾 if there are errors, nothing otherwise
return_status() {
   echo "%(?..👾)"
}


prompt_indicator() {
   echo $'%B\u276f%b'
}

setopt prompt_subst
zstyle ':vcs_info:git*' formats "%{$FG[013]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
PROMPT='%B$(username) $(directory) | ${vcs_info_msg_0_}
$(prompt_indicator) '
RPROMPT='$(current_time)$(return_status)'

VIRTUAL_ENV_DISABLE_PROMPT=0
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=" %{$fg[orange]%}🐍"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
