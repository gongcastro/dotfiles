# vim:ft=zsh ts=2 sw=2 sts=2

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_no_bold[orange]%}%{$FG[208]%} \ue727 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[orange]%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg_bold[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

PROMPT='
%{$fg_bold[orange]%}%c%{$reset_color%} %{$(git_prompt_info)%} $(virtualenv_prompt_info)
› '

RPROMPT='$(ruby_prompt_info)'

VIRTUAL_ENV_DISABLE_PROMPT=0
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=" %{$fg[orange]%}🐍"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
