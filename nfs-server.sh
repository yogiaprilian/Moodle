#install nfs
sudo apt update 

sudo apt-get -y install nfs-kernel-server

#create folder
sudo mkdir /home/erudeye/nfs -p

#give access permission
sudo chown nobody:nogroup /home/erudeye/nfs
sudo chmod 777 /home/erudeye/nfs

#mv /etc/exports
sudo mv /etc/exports /var/backups/

#download exports share file 
sudo wget https://raw.githubusercontent.com/yogiaprilian/Moodle/master/exports -P /etc/

sudo systemctl restart nfs-kernel-server

