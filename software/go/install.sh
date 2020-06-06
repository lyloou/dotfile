#!/bin/bash
NAME=go1.14.4.linux-amd64.tar.gz
cd /tmp/
wget -v https://dl.google.com/go/$NAME
mkdir -p $HOME/c
tar -zxvf $NAME -C $HOME/c/ 
