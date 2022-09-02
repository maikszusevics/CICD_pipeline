#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install nginx -y
sudo systemctl enable ngninx 
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - 
sudo apt-get install -y nodejs
sudo cp -f /app/reverse_proxy /etc/nginx/sites-available/default
sudo systemctl restart nginx
sudo apt-get update
sudo apt-get upgrade -y
export DB_HOST=mongodb://34.253.184.253:27017/posts
npm install express -y
npm install mongoose -y
npm install