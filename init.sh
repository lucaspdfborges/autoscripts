#setting up internet connection
echo 'Defaults        env_keep = "http_proxy ftp_proxy"' | sudo EDITOR='tee -a' visudo
gnome-terminal --command='ping 10.66.10.68'

# setting up django
sudo apt-get update
sudo apt-get install python3-pip
pip3 install django

# Downloading atom
sudo apt-get install -y curl
curl https://atom.io/download/deb --output atom-amd64.deb
sudo dpkg -i atom-amd64.deb
sudo apt-get install -f
