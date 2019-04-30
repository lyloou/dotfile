# tmux
cd ~
sh .tmux_session.sh

# webhook
cd ~/w/rryp/renren/webhook
sh start.sh

# ngrok
cd ~/c/ngrok/linux
sh webhook.sh
sh eros.sh

# file server
nohup http-server /home/lilou/w/share -p 9090 > /dev/null 2>&1 & 
