#!/bin/sh

tmux new -s rryp-app -d -c ~/w/rryp/rryp-app
tmux new -s webhook -d -c ~/w/rryp/webhook
tmux new -s ngrok -d -c ~/c/ngrok/renrenyoupin/linux
tmux new -s zoo -d -c ~/t

