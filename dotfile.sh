#!/bin/bash
# http://c9s.blogspot.com/2009/11/git-dotfiles.html
# http://mingxinglai.com/cn/2012/09/use-git-to-manage-your-dotfiles/

ln -fs `pwd`/vimrc ~/.vimrc
ln -fs `pwd`/tmux.conf ~/.tmux.conf
ln -fs `pwd`/profile ~/.profile
ln -fs `pwd`/gitconfig ~/.gitconfig

ln -fs `pwd`/zsh/zshrc ~/.zshrc
ln -fs `pwd`/zsh/tool.zsh ~/.zsh_tool.zsh