# apt-cache search openjdk
sudo apt-get install openjdk-11-jre openjdk-11-jdk -y
mkdir -p $HOME/c/java/
ln-sf /usr/lib/jvm/java-11-openjdk-amd64 $HOME/c/java/jdk
