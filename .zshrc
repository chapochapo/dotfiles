fastfetch

# Add zsh-completions to fpath
fpath=(/usr/share/zsh/site-functions $fpath)

# Enable completion
autoload -Uz compinit && compinit

# Source plugins from pacman
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias l="ls -lh"
alias ll="ls -lha"
alias update="sudo pacman -Syy"
alias upgrade="sudo pacman -Syu"
alias pm="sudo pacman"
alias ff="fzf --style full --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'"
alias ls='eza $eza_params'
alias l='eza --git-ignore $eza_params'
alias ll='eza --all --header --long $eza_params'
alias llm='eza --all --header --long --sort=modified $eza_params'
alias la='eza -lbhHigUmuSa'
alias lx='eza -lbhHigUmuSa@'
alias lt='eza --tree $eza_params'
alias tree='eza --tree $eza_params'

# Basic prompt
PROMPT='%F{cyan}%n%f@%F{blue}%m%f:%F{green}%~%f$ '

# Word navigation
bindkey "^[[1;5C" forward-word   # Ctrl+Right
bindkey "^[[1;5D" backward-word  # Ctrl+Left

# Delete word
bindkey "^[[3;5~" kill-word      # Ctrl+Delete
bindkey "^W" backward-kill-word  # Ctrl+Backspace

# Home/End keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Treat only _ as a part of a word, enables alt+backspace on path
WORDCHARS='_'
