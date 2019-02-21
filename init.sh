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

# Downloading and launching atom
cd ..
cd Downloads
wget -O atom.deb "https://atom.io/download/deb"
sudo dpkg -i atom.deb
sudo apt-get install -y -f
atom

#Installing NODE
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt-get install nodejs

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

