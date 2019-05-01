#/bin/bash
# Firstly, you need modify smb.conf file

sudo apt-get install samba -y
sudo cat smb.conf >> /etc/samba/smb.conf
sudo sed -i "s|\$USER|$USER|g" /etc/samba/smb.conf
mkdir -p $HOME/w/smbshare

# sudo smbpasswd -a $USER
# sudo service smbd restart
