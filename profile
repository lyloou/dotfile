# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# jump to tmux when connect to remote server
#if [ -z "$TMUX" ]; then
#   tmux attach -t default || tmux new -s default
#fi

alias reloadrc="source ~/.zshrc"
# some more aliases
alias cdw='cd ~/w'
alias cdp='cd ~/p'
alias cdt='cd ~/t'
alias cdc='cd ~/c'
alias cdwr='cd ~/w/rryp/rryp-app'
alias gl='git lg'
alias e.='nohup nautilus . >/dev/null 2>&1 &'
alias www='python -m SimpleHTTPServer 8000'
alias wget='wget -c'
alias tt='trash-put'
alias ..='cd ..'
alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '
alias a.='sh ~/.startup.sh'
#列出当前目录里最大的10个文件。
alias dutop = 'du -s * | sort -n | tail'
# 当你的机器在内网的时候，可以通过这个命令查看外网的IP。
alias ipconfigme = 'curl ifconfig.me'
alias marix='tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
## Show hidden files ##
alias l.='ls -d .* --color=auto'
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'

#9: Create a new set of commands
alias path='echo -e ${PATH//:/\\n}'
alias d='date +%F'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%Y-%m-%d"'

alias xrenew='git pull && mvn package && cd release && ./restart.sh && cd ..'
# env idea
export IDEAPATH=$HOME/c/idea

# env go
export GOROOT=$HOME/c/go
export GOPATH=$HOME/w/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$IDEAPATH/bin

# env node
export NODEPATH=$HOME/c/js/node
export PATH=$PATH:$NODEPATH/bin

# env lua
export LUAPATH=$HOME/c/lua
export PATH=$PATH:$LUAPATH/src

# env java and android
export JAVA_HOME=$HOME/c/java/jdk  ## 这里要注意目录要换成自己解压的jdk 目录
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export ANDROID_HOME=~/c/android/as
export ANDROID_SDK=~/c/android/sdk
export ANDROID_NDK=~/c/android/ndk
export PATH=${GOPATH}/bin:${JAVA_HOME}/bin:${ANDROID_HOME}/bin:${ANDROID_SDK}/platform-tools/:$PATH

# env maven
export M2_HOME=~/c/java/maven
export PATH=${M2_HOME}/bin:$PATH

export RUN_AS_USER=root

# zookeeper
export ZOOKEEPER_HOME=~/c/apache/zookeeper
export PATH=$PATH:$ZOOKEEPER_HOME/bin

