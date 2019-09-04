#setting up internet connection
echo 'Defaults        env_keep = "http_proxy ftp_proxy"' | sudo EDITOR='tee -a' visudo
sudo rm /etc/apt/sources.list
sudo apt-get update

sudo apt-get install -y python3-pip && pip3 install django && pip3 install virtualenv && sudo apt install virtualenv -y
cd Desktop
sudo apt-get install -y git
git clone https://github.com/lucaspdfborges/sensorweb.git

# Open TCP port
sudo iptables -I INPUT 1 -p tcp --dport 3000 -j ACCEPT

#MySQL
mkdir -p /var/run/mysqld
chown mysql:mysql /var/run/mysqld

#PostgreSQL
sudo apt-get install postgresql postgresql-contrib
sudo -i -u postgres
psql -f /path/to/file.sql
\dt
\q
 SELECT * FROM "table_name";

#Cleaning the package system
sudo apt remove --purge nodejs npm -y
sudo apt clean
sudo apt autoclean
sudo apt install -f
sudo apt autoremove

# Downloading and launching atom
cd ..
cd Downloads
wget -O atom.deb "https://atom.io/download/deb" && sudo dpkg -i atom.deb && sudo apt-get install -y -f
atom

#Installing NODE.JS and NPM
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
nvm install node

# goo to :

https://github.com/glenpike/npm-g_nosudo

# Setting up Arduino and ESP32
wget -c https://www.arduino.cc/download_handler.php?f=/arduino-1.8.9-linux64.tar.xz -O - | tar -xz
wget -c arduino.tar.xz "https://www.arduino.cc/download_handler.php"
tar xf arduino.tar.xz
sudo apt-get install python-pip
(sudo) pip install pyserial
sudo usermod -a -G dialout $USER

https://dl.espressif.com/dl/package_esp32_index.json

# Install MongoDB
wget -O mongodb.deb "https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/4.0/multiverse/binary-amd64/mongodb-org-server_4.0.6_amd64.deb"
sudo dpkg -i mongodb.deb
sudo apt-get install -y -f
sudo systemctl start mongod
sudo systemctl status mongod
sudo apt-get install mongodb-clients
npm i mongoose --save

# Starting the webapp
cd ..
cd Desktop/sensorweb
source myvenv/bin/activate
pip3 install djangorestframework
pip3 install markdown       # Markdown support for the browsable API.
pip3 install django-filter  # Filtering support
pip3 install djangorestframework-jwt
firefox http://127.0.0.1:8000
python3 manage.py runserver

#Remove stuff from Ubuntu
sudo rm -rf /usr/share/applications/ubuntu-amazon-default.desktop
sudo apt-get remove --purge libreoffice*
sudo apt-get purge thunderbird* 
sudo apt-get remove rhythmbox
sudo apt-get purge aisleriot gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy
sudo apt-get remove --auto-remove cheese
sudo apt purge gnome-mines
sudo apt-get purge totem totem-plugins
sudo apt remove aisleriot gnome-mahjongg gnome-mines gnome-sudoku 
sudo apt-get clean
sudo apt-get autoremove


#Docker 

sudo mkdir /etc/systemd/system/docker.service.d

sudo nano /etc/systemd/system/docker.service.d/http-proxy.conf

[Service]
Environment=http_proxy=http://10.66.10.68:3128/
Environment=no_proxy=localhost,127.0.0.1
Environment=https_proxy=http://10.66.10.68:3128/

systemctl daemon-reload
systemctl restart docker

/etc/default/docker
DOCKER_OPTS="--storage-driver=devicemapper"

# Redis
sudo apt install redis-server -y && sudo nano /etc/redis/redis.conf
supervised systemd
sudo systemctl restart redis.service
sudo systemctl status redis
