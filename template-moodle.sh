#install nfs client
sudo apt update 

sudo apt-get -y install nfs-common

#create folder 
sudo mkdir -p /home/erudeye/nfs/website

#give full access
sudo chmod 777 /home/erudeye/nfs/website

#mount folder
sudo mount 10.0.0.4:/home/erudeye/nfs/website /home/erudeye/nfs/website

#Create folder backup config

sudo mkdir /home/erudeye/backup-config

sudo chmod 777 /home/erudeye/backup-config

#fstab

sudo mv /etc/fstab /home/erudeye/backup-config

sudo wget https://raw.githubusercontent.com/yogiaprilian/Moodle/master/fstab -P /etc/

#Install Apache

sudo apt update
sudo apt-get -y install apache2

sudo mv /etc/apache2/apache2.conf /home/erudeye/backup-config
sudo wget https://raw.githubusercontent.com/yogiaprilian/Moodle/master/apache2.conf -P /etc/apache2

sudo mv /etc/apache2/sites-available/000-default.conf /home/erudeye/backup-config
sudo wget https://raw.githubusercontent.com/yogiaprilian/Moodle/master/000-default.conf -P /etc/apache2/sites-available

sudo sed -i "s/Options Indexes FollowSymLinks/Options FollowSymLinks/" /etc/apache2/apache2.conf

sudo systemctl restart apache2.service


#Install PHP 7

sudo apt-get -y install software-properties-common

sudo add-apt-repository ppa:ondrej/php -y

sudo apt update


sudo apt install -y php7.2 libapache2-mod-php7.2 php7.2-common php7.2-gmp php7.2-curl php7.2-intl php7.2-mbstring php7.2-xmlrpc php7.2-mysql php7.2-gd php7.2-xml php7.2-soap php7.2-cli php7.2-zip

sudo mv /etc/php/7.2/apache2/php.ini /home/erudeye/backup-config 

sudo wget https://raw.githubusercontent.com/yogiaprilian/Moodle/master/php.ini -P /etc/php/7.2/apache2/

sudo systemctl restart apache2.service


#Download Moodle

sudo apt install git curl

sudo git clone -b MOODLE_36_STABLE git://git.moodle.org/moodle.git moodle

sudo mv moodle /home/erudeye/nfs
sudo chmod 777 /home/erudeye/nfs/moodle

sudo mkdir -p /home/erudeye/nfs/moodledata
sudo chmod 777 /home/erudeye/nfs/moodledata

sudo wget https://raw.githubusercontent.com/yogiaprilian/Moodle/master/moodle.conf -P /etc/apache2/sites-available/


sudo a2enmod rewrite

sudo systemctl restart apache2.service

sudo a2ensite moodle.conf

sudo systemctl reload apache2

sudo mv /etc/mysql/my.cnf /home/erudeye/backup-config

sudo wget https://raw.githubusercontent.com/yogiaprilian/Moodle/master/my.cnf -P /etc/mysql/

sudo systemctl restart mariadb.service

sudo systemctl restart apache2.service
