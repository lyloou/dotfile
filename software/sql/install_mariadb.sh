#!/bin/bash
lsb_release -a
sudo apt-get install software-properties-common -y
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirrors.neusoft.edu.cn/mariadb/repo/10.4/ubuntu bionic main'
sudo apt update
sudo apt install mariadb-server -y
systemctl status mariadb
mysql -V
