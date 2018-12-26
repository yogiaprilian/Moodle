#install nfs
sudo apt update 

sudo apt-get -y install nfs-kernel-server

#create folder
sudo mkdir /home/erudeye/nfs/website -p

#give access permission
sudo chown nobody:nogroup /home/erudeye/nfs/website
sudo chmod 777 /home/erudeye/nfs/website

#mv /etc/exports
sudo mv /etc/exports /home/erudeye

#download exports share file 
sudo wget https://github.com/yogiaprilian/NFS-Ubuntu/blob/master/exportsnfs -P /etc/exports

sudo systemctl restart nfs-kernel-server
