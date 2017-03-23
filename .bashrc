#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

##################
# Personal aliases
##################

alias ll="ls -lhA"
alias ls="ls -CF --color=auto"
alias ..="cd .."
#alias df="df -Tha --total"
alias du="du -ach | sort -h"
alias free="free -mt"
alias ps="ps auxf"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias mkdir="mkdir -pv"
alias wget="wget -c"
alias histg="history | grep"
alias df="pydf"
alias myip="curl http://ipecho.net/plain; echo"
alias gparted="gksu gparted"
alias watch="watch -bdc"
alias yaourt-upgrade="yaourt -Syyua"
alias yaourt-upgrade-devel="yaourt -Syyua --devel"

###########
# Functions
###########

# Changes to directory after creation
mcd () {
    mkdir -pv $1
    cd $1
}

# Decompresses compresses file
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract 
<path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

###############
# Liquid Prompt
###############

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source /usr/bin/liquidprompt

######
# Ruby
######

# Ruby gems path
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Prompt package name if command does not exist
source /usr/share/doc/pkgfile/command-not-found.bash

#########
# History
#########

# Don't keep junk in histoy
export HISTIGNORE=" *:ls:history:histg *:.."
export HISTCONTROL=ignoredups

##############
# Autocomplete
##############

# Checks repo for packages matching unknown command
source /usr/share/doc/pkgfile/command-not-found.bash
