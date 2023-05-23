#! /bin/bash

sudo apt update -y
sudo apt install -y apache2


sudo systemctl start apache2
sudo systemctl enable apache2

sudo bash -c 'echo "Hello World from $(hostname -f)" > /var/www/html/index.html'