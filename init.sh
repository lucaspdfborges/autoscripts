#setting up internet connection
echo 'Defaults        env_keep = "http_proxy ftp_proxy"' | sudo EDITOR='tee -a' visudo
gnome-terminal --command='ping 10.66.10.68'

#enable access to repos
echo "deb-src http://archive.ubuntu.com/ubuntu bionic main restricted  #Added by software-properties
" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu/ bionic main restricted multiverse universe  #Added by software-properties
" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://security.ubuntu.com/ubuntu/ bionic-security main restricted multiverse universe #Added by software-properties
 " | sudo tee -a /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu/ bionic-updates main restricted multiverse universe  #Added by software-properties
" | sudo tee -a /etc/apt/sources.list

sleep 5

# setting up django
sudo rm /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -y python3-pip
pip3 install django
cd Desktop
sudo apt-get install -y git
git clone https://github.com/lucaspdfborges/sensorweb.git

#MySQL
mkdir -p /var/run/mysqld
chown mysql:mysql /var/run/mysqld

#Cleaning the package system
sudo apt remove --purge nodejs npm -y
sudo apt clean
sudo apt autoclean
sudo apt install -f
sudo apt autoremove

# Downloading and launching atom
cd ..
cd Downloads
wget -O atom.deb "https://atom.io/download/deb"
sudo dpkg -i atom.deb
sudo apt-get install -y -f
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

