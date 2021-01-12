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

# +----------------------------------+
# |          some GIT alias          |
# +----------------------------------+
alias gbr='git branch'
alias gbrvv='git branch -vv'
alias gclone='git clone'
alias gcm='git commit -m'
alias gcma='git commit -a -m'
alias gco='git checkout'
alias gdi='git diff'
alias gdn='git diff --name-status'
alias gds='git diff --stat'
alias gdc='git diff --cached'
alias gdhead='git diff HEAD'
alias gfc='git fetch'
alias glast='git log --stat -1 HEAD'
alias glo='git log --format="%C(yellow)%h%Creset %C(auto)%d%Creset %s %C(blue)(%cr) %C(blue)<%an>" --graph'
alias gloa='git log --format="%C(yellow)%h%Creset %C(auto)%d%Creset %s %C(blue)(%cr) %C(blue)<%an>" --graph --all'
alias glol='git log --format="%C(yellow)%h%Creset %C(auto)%d%Creset %s %C(blue)(%cr) %C(blue)<%an>" --graph'
alias glof='git log --format="%C(yellow)%h%Creset %C(auto)%d%Creset %s %C(blue)(%cr) %C(blue)<%an>"'
alias g='clear && git log --format="%C(yellow)%h%Creset %C(auto)%d%Creset %s %C(blue)(%cr) %C(blue)<%an>" --graph -15 && echo ""'
alias gg='clear && git log --format="%C(yellow)%h%Creset %C(auto)%d%Creset %s %C(blue)(%cr) %C(blue)<%an>" --graph --all -15 && echo ""'
alias gmerge='git merge --no-ff'
alias gpull='git pull'
alias gpulla='git pull --all'
alias gpush='git push'
alias gpusha='git push --all'
alias gptags='git push origin --tags'
alias gref='git reflog'
alias gre='git remote'
alias grev='git remote -v'
alias gsa='git stash'
alias gsapply='git stash apply'
alias gsclear='git stash clear'
alias gsdrop='git stash drop'
alias gslist='git stash list'
alias gsshow='git stash show'
alias gspop='git stash pop'
alias gst=' clear && git status -bs'
alias gtag='git tag'
# rollback
alias gunstage='git reset HEAD --'
alias groll='git checkout HEAD --'
alias gchead='git checkout HEAD --'
alias grhead='git reset HEAD --'
# GIT底层命令
alias gindex='git ls-files -s'
alias gtree='git ls-tree -r'
alias gtype='git cat-file -t'
alias gpprint='git cat-file -p'

# +----------------------------------+
# |           OTHER alias            |
# +----------------------------------+
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias '.bashrc'='vim ~/.bashrc && source ~/.bashrc'
alias bgrep='cat ~/.bashrc | grep --color=auto'
alias calculator='python3'
alias clean='sudo apt autoclean'
alias desktop='cd ~/Desktop && ls'
alias document='cd ~/Documents && ls'
alias download='cd ~/Downloads && ls'
alias dir='dir --fromat=long --color=auto'
alias du='du -h'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias free='free -h'
alias '.gitconfig'='vim ~/.gitconfig'
alias grep='grep --color=auto'

alias hgrep='history | grep --color=auto'
alias id_rsa.pub='echo "~/.ssh/id_rsa.pub: " && cat ~/.ssh/id_rsa.pub'
alias install='sudo apt install'
alias jnotebook='jupyter notebook &>/dev/null &'
alias l='ls --color=auto -C'
alias la='ls --color=auto -CA'
alias ll='ls --color=auto -ClhA'
alias less='less --color=auto -m'

alias profile='sudo vim /etc/profile && source /etc/profile'
alias remove='sudo apt autoremove'
alias s='source ~/.bashrc'
alias schmod='sudo chmod'
alias shadowsocks='sudo sslocal -c ~/Documents/ss.json -d restart'
alias smkdir='sudo mkdir'
alias sql="mysql -uroot -p980620 --prompt='\u@\h [\d]> ' --database=must"
alias 'ss.json'='vim ~/Documents/ss.json'
alias sservice='sudo service'
alias svim='sudo vim'
alias t1='tree -L 1'
alias t2='tree -L 2'
alias t3='tree -L 3'
alias t4='tree -L 4'
alias t5='tree -L 5'

alias vdir='vdir --color=auto'
alias update='sudo apt update'
alias upgrade='sudo apt full-upgrade'
alias .vimrc='vim /home/ypl/workspace/yuanpeilin.github.io/software/src/vimrc'
alias wl='wc -l'
alias ws='cd ~/workspace && ls'

# +----------------------------------+
# |            USER alias            |
# +----------------------------------+
PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u@\h\[\e[00m\] \[\e[01;34m\]\w$(git_branch)\[\e[00m\]\$ '
alias yuanpeilin='cd ~/workspace/yuanpeilin.github.io && git status -bs'
alias vultr_japen='ssh ypl@149.28.29.166'

todo_help(){
    echo -e "\e[1m Usage: \e[0m
    -a <string>   add
    -d <number>   do
    -h            help
    -l            list
    -r <number>   remove"
}

todo_getopts(){
    while getopts ":a:d:h:r:l" arg; do
        case "$arg" in
            a)
                echo "[ ] \e[0m $OPTARG \e[0m" >> ~/.todo;;
            d)
                sed -n "$OPTARG"p ~/.todo | sed -i 's/\[ \] \\e\[0m/\[\*\] \\e\[9m/g'
                ;;
            l)
                i=1
                while read -r line; do
                    echo -e " $i $line"
                    i=$((i+1))
                done < ~/.todo
                unset i
                ;;
            r)
                sed -i "$OPTARG"d ~/.todo;;
            *)
                todo_help;;
        esac
    done
    shift $(($OPTIND-1))
    unset OPTARG OPTIND
}

todo(){
    if [ "$#" -eq 0 ]; then
        todo_help
    else
        todo_getopts "$@"
    fi
}
