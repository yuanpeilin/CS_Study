# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
# |             History              |
# +----------------------------------+
HISTSIZE=3000
HISTFILESIZE=6000
# don't put duplicate lines or lines starting with space in the history.
# 忽略连续相同的命令 忽略空格开头的命令
HISTCONTROL=ignoreboth
# 格式化历史记录
HISTTIMEFORMAT='%F %T '
# append to the history file, don't overwrite it
# 多个终端的情况下, 改为追加命令(默认最后的终端会覆盖以前的)
shopt -s histappend
# 实时追加当前终端的命令到历史
PROMPT_COMMAND="history -a"

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

# +----------------------------------+
# |             set PS1              |
# +----------------------------------+
# \[\e[01;32m\] 设置字体, 01代表加粗, 32代表颜色(范围30-40)
# \[\e[00m\] 重置颜色
PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u@\h\[\e[00m\] \[\e[01;34m\]\w$(git_branch)\[\e[00m\]\$ '

# +----------------------------------+
# |          some GIT alias          |
# +----------------------------------+
alias gadd='git add'
alias gbr='git branch'
alias gbrvv='git branch -vv'
alias gclone='git clone'
alias gcm='git commit -m'
alias gcma='git commit -a -m'
alias gco='git checkout'
alias gdi='git diff'
alias gdn='git diff --name-status'
alias gdc='git diff --cached'
alias gds='git diff --staged'
alias gdhead='git diff HEAD'
alias gfc='git fetch'
alias glo='git log --graph --decorate --oneline --all'
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
alias gst='git status'
alias gtag='git tag'
# +----------  rollback ------------+
alias gunstage='git reset HEAD --'
alias groll='git checkout HEAD --'
alias gchead='git checkout HEAD --'
alias grhead='git reset HEAD --'
# +---------- GIT底层命令 ----------+
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
alias .bashrc='vim ~/.bashrc && source ~/.bashrc'
alias bgrep='cat ~/.bashrc | grep'
alias calculator='python3'
alias clean='sudo apt autoclean'
alias csstudy='cd ~/workspace/cs_study && git status'
alias desktop='cd ~/Desktop && ls'
alias document='cd ~/Documents && ls'
alias download='cd ~/Downloads && ls'
alias dir='dir --fromat=long'
alias du='du -h'
alias free='free -h'

alias hgrep='history | grep'
alias id_rsa.pub='echo "~/.ssh/id_rsa.pub: " && cat ~/.ssh/id_rsa.pub'
alias install='sudo apt install'
alias l='ls -C'
alias la='ls -CA'
alias ll='ls -ClhA'
alias less='less -m'

alias profile='sudo vim /etc/profile && source /etc/profile'
alias remove='sudo apt autoremove'
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

alias update='sudo apt update'
alias upgrade='sudo apt full-upgrade'
alias .vimrc='vim ~/.vimrc'
alias wl='wc -l'
alias ws='cd ~/workspace && ls'
alias yuanpeilin='cd ~/workspace/yuanpeilin.github.io && git status'

# +----------------------------------+
# |            USER alias            |
# +----------------------------------+
alias vultr_japen='ssh ypl@149.28.29.166'

