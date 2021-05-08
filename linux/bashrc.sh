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
# |           Environment            |
# +----------------------------------+
PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u@\h\[\e[00m\] \[\e[01;34m\]\w$(git_branch)\[\e[00m\]\$ '

export JAVA_HOME='/opt/java8/jdk1.8.0_281'
export PATH=$JAVA_HOME/bin:$PATH


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

cd_git_project() {
    clear
    cd "$1"
    echo -e '\e[01m--------------------\e[00m'
    git log -9 --format="%C(yellow)%h%Creset %C(auto)%d%Creset %s %C(blue)(%cr) <%an>" --graph
    echo -e '\e[01m--------------------\e[00m'
    if [[ -z $(git stash list) ]]; then
        echo 'no stash'
    else
        git stash list
    fi
    echo -e '\e[01m--------------------\e[00m'
    git branch -vv
    echo -e '\e[01m--------------------\e[00m'
    if [[ -z $(git status -s) ]]; then
        echo 'No file changed'
    else
        git status -sb
    fi
    echo -e '\e[01m--------------------\e[00m'
}

plant_uml_server(){
    cd /opt/plantuml-server
    sudo mvn jetty:run -Djetty.port=9999 &>/dev/null &
}

# ln_check   源文件路径   源文件名   链接文件路径   链接文件名
ln_check(){
    if [[ $(ls -l "$1" | grep "$2" | awk '{print $2}') < 2 ]]; then
        rm "$3$4"
        ln "$1$2" "$3$4"
        echo "link $3$4 has broken, delete it and link again. Source: $1$2"
    fi
}

todo(){
    . ~/todo.sh "$@"
}

# +----------------------------------+
# |          some GIT alias          |
# +----------------------------------+
alias g='clear && git log --format="%C(yellow)%h%Creset %C(auto)%d%Creset %s %C(blue)(%cr) <%an>" --graph -15 && echo ""'
alias gg='clear && git log --format="%C(yellow)%h%Creset %C(auto)%d%Creset %s %C(blue)(%cr) <%an>" --graph --all -15 && echo ""'
alias glo='git log --format="%C(yellow)%h%Creset %C(auto)%d%Creset %s %C(blue)(%cr) <%an>" --graph'
alias gloa='git log --format="%C(yellow)%h%Creset %C(auto)%d%Creset %s %C(blue)(%cr) <%an>" --graph --all'
alias gbr='git branch -vv'
alias gbrvv='git branch -vv'
alias gclone='git clone'
alias gca='git commit --amend'
alias gcma='git commit -a -m'
alias gcm='git commit -m'
alias gco='git checkout'
alias gdi='git diff'
alias gdc='git diff --cached'
alias gdn='git diff --name-status'
alias gds='git diff --stat'
alias gft='git fetch'
alias gindex='git ls-files -s'
alias glast='git log --stat -1 HEAD'
alias gmerge='git merge --no-ff'
alias gpprint='git cat-file -p'
alias gptags='git push origin --tags'
alias gpull='git pull'
alias gpulla='git pull --all'
alias gpush='git push'
alias gpusha='git push --all'
alias grf='git reflog'
alias gre='git remote'
alias grev='git remote -v'
alias groll='git checkout HEAD --'
alias gsa='git stash'
alias gsapply='git stash apply'
alias gsclear='git stash clear'
alias gsdrop='git stash drop'
alias gslist='git stash list'
alias gspop='git stash pop --index --include-untracked'
alias gsshow='git stash show'
alias gst=' clear && git status -bs'
alias gtag='git tag'
alias gtree='git ls-tree -r'
alias gtype='git cat-file -t'
alias gunstage='git reset HEAD --'

gproxy() {
    echo "before:"
    git config http.proxy
    git config https.proxy

    git config --global http.proxy 'socks5://127.0.0.1:1080'
    git config --global https.proxy 'socks5://127.0.0.1:1080'

    echo "after:"
    git config http.proxy
    git config https.proxy
}

gunproxy() {
    echo "before:"
    git config http.proxy
    git config https.proxy

    git config --global --unset http.proxy
    git config --global --unset https.proxy

    echo "after:"
    git config http.proxy
    git config https.proxy
}

# +----------------------------------+
# |           OTHER alias            |
# +----------------------------------+
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias vdir='vdir --color=auto'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias '.bashrc'='vim ~/.bashrc && source ~/.bashrc'
alias '.bash_aliases'='vim ~/.bash_aliases && source ~/.bashrc'
alias bgrep='cat ~/.bashrc | grep'
alias calculator='python3'
alias clean='sudo apt autoclean'
alias desktop='cd ~/Desktop && ls'
alias document='cd ~/Documents && ls'
alias download='cd ~/Downloads && ls'
alias dir='dir --fromat=long --color=auto'
alias du='du -h'
alias free='free -h'
alias '.gitconfig'='vim ~/.gitconfig'

alias hgrep='history | grep'
alias id_rsa.pub='echo "~/.ssh/id_rsa.pub: " && cat ~/.ssh/id_rsa.pub'
alias install='sudo apt install'
alias jnotebook='jupyter notebook &>/dev/null &'
alias l='ls -C'
alias la='ls -CA'
alias ll='ls -ClhA'
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

alias update='sudo apt update'
alias upgrade='sudo apt full-upgrade'
alias .vimrc='vim /home/ypl/workspace/yuanpeilin.github.io/software/src/vimrc'
alias wl='wc -l'
alias ws='cd ~/workspace && ls'

# +----------------------------------+
# |           Start Script           |
# +----------------------------------+
clear
todo -l
ln_check /home/ypl/workspace/yuanpeilin.github.io/linux/ bashrc.sh /home/ypl/ .bashrc
ln_check /home/ypl/workspace/yuanpeilin.github.io/linux/ todo.sh /home/ypl/ todo.sh
ln_check /home/ypl/workspace/yuanpeilin.github.io/linux/src/ vimrc /home/ypl/ .vimrc

# +----------------------------------+
# |            USER alias            |
# +----------------------------------+
export VULTR='104.156.252.159'

alias svultr='ssh root@$VULTR'
alias yuanpeilin='cd_git_project ~/workspace/yuanpeilin.github.io'

mc() {
    fcitx_pids=$(ps -ef | grep fcitx | awk '{print $2}' | tr '\n' ' ')
    echo "$fcitx_pids"
    for pid in $fcitx_pids; do
        kill $pid
    done
    unset fcitx_pids pid
    cd ~
    java -jar /opt/hmcl/HMCL-3.3.172.jar &>/dev/null &
}
