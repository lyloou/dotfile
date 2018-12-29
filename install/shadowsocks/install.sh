###### shadowsocks
sudo apt install shadowsocks -y
sudo cp shadowsocks.json /etc/shadowsocks.json
sudo cp shadowsocks.service /etc/systemd/system/shadowsocks.service
systemctl enable /etc/systemd/system/shadowsocks.service


###### proxychains
sudo apt install proxychains -y
sudo proxychains apt-get update
# now you can config your proxy in /etc/proxychains.conf
# socks5 127.0.0.1 1080


###### privoxy
sudo apt-get install privoxy -y
# vim /etc/privoxy/config
# add below line
# forward-socks5 / 0.0.0.0:1080 .
curl  -x 127.0.0.1:8118 http://www.google.com
