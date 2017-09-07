# .bashrc

# Variables section

WORKSPACE="/workspace"
USER=""
KEY_PATH="./ssh/main"

eval `ssh-agent -s`
ssh-add ${KEY_PATH}

JUMPNODE_VERTICAL_PDEV=40.68.194.188
JUMPNODE_VERTICAL_DEV=40.113.106.205
JUMPNODE_VERTICAL_QA=40.68.221.197
JUMPNODE_VERTICAL_PROD=13.95.156.210

# Aliases section

alias clonedev="git clone https://git.dev.eon.com/espp-infrastructure/chef-repo-espp-shark-dev.git"
alias cloneqa="git clone https://git.dev.eon.com/espp-infrastructure/chef-repo-espp-shark-qa.git"
alias cloneprod="git clone https://git.dev.eon.com/espp-infrastructure/chef-repo-espp-shark-production.git"
alias clonepdev="git clone https://git.dev.eon.com/espp-infrastructure/chef-repo-espp-shark-pdev.git"
alias pdssh="ssh -tt ${user}@${JUMPNODE_VERTICAL_PDEV} ssh -tt"
alias dssh="ssh -tt ${user}@${JUMPNODE_VERTICAL_DEV} ssh -tt"
alias qssh="ssh -tt ${user}@${JUMPNODE_VERTICAL_QA} ssh -tt"
alias pssh="ssh -tt ${user}@${JUMPNODE_VERTICAL_PROD} ssh -tt"
alias pdjump="ssh ${user}@${JUMPNODE_VERTICAL_PDEV}"
alias djump="ssh ${user}@${JUMPNODE_VERTICAL_DEV}"
alias qajump="ssh ${user}@${JUMPNODE_VERTICAL_QA}"
alias pjump="ssh ${user}@${JUMPNODE_VERTICAL_PROD}"
alias toWorkspace="cd ${WORKSPACE}"
alias toDev="cd ${WORKSPACE}/chef-repo/chef-repo-espp-shark-dev"
alias toQa="cd ${WORKSPACE}/chef-repo/chef-repo-espp-shark-qa"
alias toPdev="cd {WORKSPACE}/chef-repo/chef-repo-espp-shark-pdev"
alias toProd="cd ${WORKSPACE}/chef-repo/chef-repo-espp-shark-production"

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
