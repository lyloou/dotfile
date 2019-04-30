#/bin/bash
# Firstly, you need modify smb.conf file

sudo apt-get install samba -y
sudo cp smb.conf /etc/samba/smb.conf
mkdir -p $HOME/w/smbshare

# sudo smbpasswd -a user
# sudo service smbd restart
