#!/bin/bash
# https://tecadmin.net/install-openjdk-java-ubuntu/
# apt-cache search openjdk

# remove installed java
# sudo apt-get purge openjdk-\* icedtea-\* icedtea6-\*
#sudo apt-get install openjdk-11-jre openjdk-11-jdk -y
sudo apt-get install openjdk-8-jre openjdk-8-jdk -y

mkdir -p $HOME/c/java/

#ln -sf /usr/lib/jvm/java-11-openjdk-amd64 $HOME/c/java/jdk
ln -sf /usr/lib/jvm/java-8-openjdk-amd64 $HOME/c/java/jdk
