# .bashrc

# Variables section

WORKSPACE="/workspace"
USER="alex"

# Aliases section

alias grep='grep --color=auto'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

alias psu='ps aux'
alias psf='ps afx'

alias genpasswd='strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 16 | tr -d '\n'; echo'
alias listen='lsof -P -i -n'
alias stat='netstat -anlp | more'

# Customisation section

export HISTSIZE=10000
export HISTFILESIZE=120000
export PS1="\[$(tput setaf 2)\]\t::\[$(tput setaf 1)\][\u@\h:\w]\[$(tput setaf 6)\]::\s\\$\[$(tput sgr0)\]"



# Main section

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
