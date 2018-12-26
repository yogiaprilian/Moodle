#install nfs
sudo apt update 

sudo apt-get -y install nfs-kernel-server

#create folder
sudo mkdir /home/erudeye/nfs -p

#give access permission
sudo chown nobody:nogroup /home/erudeye/nfs
sudo chmod 777 /home/erudeye/nfs

#mv /etc/exports
sudo mv /etc/exports /home/erudeye

#download exports share file 
sudo wget https://github.com/yogiaprilian/NFS-Ubuntu/blob/master/exportsnfs -P /etc/exports

sudo systemctl restart nfs-kernel-server

