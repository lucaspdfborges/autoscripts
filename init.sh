#setting up internet connection
echo 'Defaults        env_keep = "http_proxy ftp_proxy"' | sudo EDITOR='tee -a'$
gnome-terminal --command='ping 10.66.10.68'

# setting up django
sudo apt-get update
sudo apt-get install python3-pip
pip3 install django

# Downloading atom
sudo apt-get install -y curl
curl https://atom.io/download/deb --output atom.deb
sudo dpkg -i atom.deb
sudo apt-get install -f
