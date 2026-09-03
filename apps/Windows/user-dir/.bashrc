# Alias
alias ls='eza --icons --group-directories-first --git'
alias ll='eza -l --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first --git'

alias cat='bat --style=plain --paging=never'

alias cls='clear'


export PS1='\[\033[32m\]\u@\h \[\033[35m\]\w\[\033[0m\] $ '


# Tools
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init bash)"
fi


# Starship
eval "$('/c/Program Files/starship/bin/starship.exe' init bash)"
