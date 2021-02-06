# +----------------------------------+
# |         System Setting           |
# +----------------------------------+
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything ($- will output himBHs)
case $- in
    *i*) ;;
    *) return;;
esac

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# History
HISTSIZE=3000
HISTFILESIZE=6000
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# format
HISTTIMEFORMAT='%F %T '
# append to the history file, don't overwrite it
# 多个终端的情况下, 改为追加命令(默认最后的终端会覆盖以前的)
shopt -s histappend

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# +----------------------------------+
# |             function             |
# +----------------------------------+
git_branch() {
    branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
    if [ "${branch}" != "" ];then
        if [ "${branch}" = "(no branch)" ];then
            branch="(`git rev-parse --short HEAD`...)"
        fi
        echo "($branch)"
    fi
}

mkcd() {
    mkdir "$1"
    cd "$1"
}

gadd() {
    git add "${1:-.}"
    clear
    git status -bs
}

bak(){
    if [[ "$#" == 0 ]]; then
        echo -e '\e[1mbak\e[0m will backup files as xxx.bak'
        echo ''
        echo -e '\e[1mUsage:\e[0m'
        echo '    bak <file path1> [file path2...]'
    else
        for file in "$@"; do
            bak_file=$(echo "file".bak | sed 's/\///g')
            if [[ -e "$bak_file" ]]; then
                echo -e "\e[31;01mWARNING:\e[0m $file back up failed, $bak_file already exists"
            else
                cp -dpr "$file" "$bak_file" && echo "$file backed up"
            fi
        done
        unset file bak_file
    fi
}

todo(){
    . ~/todo.sh "$@"
}
clear && todo -L
