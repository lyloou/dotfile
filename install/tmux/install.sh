#sudo apt-get update
#sudo apt-get install build-essential

VERSION=2.8
wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz
tar xf tmux-${VERSION}.tar.gz
rm -f tmux-${VERSION}.tar.gz
cd tmux-${VERSION}

sudo apt-get install libevent-dev
sudo apt-get install ncurses-dev
./configure
make
sudo make install
cd -
sudo rm -rf /usr/local/src/tmux-*
sudo mv tmux-${VERSION} /usr/local/src
cp tmux_task.sh ~/.tmux_task.sh
