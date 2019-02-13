#setting up internet connection
echo 'Defaults        env_keep = "http_proxy ftp_proxy"' | sudo EDITOR='tee -a' visudo
gnome-terminal --command='ping 10.66.10.68'

#enable access to repos
echo "deb-src http://archive.ubuntu.com/ubuntu bionic main restricted" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu/ bionic main restricted multiverse universe" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://security.ubuntu.com/ubuntu/ bionic-security main restricted multiverse universe" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu/ bionic-updates main restricted multiverse universe" | sudo tee -a /etc/apt/sources.list

# setting up django
sudo apt-get update
sudo apt-get install python3-pip
pip3 install django
cd Desktop
git clone https://github.com/lucaspdfborges/sensorweb.git -u lucaspdfborges

# Downloading and launching atom
sudo apt-get install atom
atom sensorweb
cd sensorweb
source myvenv/bin/activate


