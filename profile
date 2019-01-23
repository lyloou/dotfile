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

# some more aliases
alias cdw='cd ~/w'
alias cdp='cd ~/p'
alias cdt='cd ~/t'
alias cdc='cd ~/c'
alias cdwr='cd ~/w/rryp/rryp-app'
alias gl='git lg'
alias e.='nohup nautilus . >/dev/null 2>&1 &'
alias www='python -m SimpleHTTPServer 8000'
alias rm='echo "Do not use this command, use trash-put instaed";false'
# env idea
export IDEAPATH=$HOME/c/idea

# env go
export GOROOT=$HOME/c/go
export GOPATH=$HOME/w/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$IDEAPATH/bin

# env lua
export LUAPATH=$HOME/c/lua
export PATH=$PATH:$LUAPATH/src

# env java and android
export JAVA_HOME=$HOME/c/java/jdk  ## 这里要注意目录要换成自己解压的jdk 目录
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export ANDROID_HOME=~/c/android/as
export ANDROID_SDK=~/c/android/sdk
export ANDROID_NDK=~/c/android/ndk
export PATH=${GOPATH}/bin:${JAVA_HOME}/bin:${ANDROID_HOME}/bin:${ANDROID_SDK}/platform-tools/:$PATH
