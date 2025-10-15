#!/bin/bash

# Update system packages
sudo apt update -y
sudo apt upgrade -y

# Install Node.js 18.x
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install PM2 globally
sudo npm install -g pm2

# Create app directory
sudo mkdir -p /var/www/nodejs-app
cd /var/www/nodejs-app

# Copy application files (you'll need to upload these)
# sudo cp -r /path/to/your/app/* .

# Install dependencies
sudo npm install --production

# Start the application with PM2
sudo pm2 start ecosystem.config.json
sudo pm2 startup
sudo pm2 save

# Configure firewall to allow port 3000
sudo ufw allow 3000
sudo ufw --force enable

echo "Application deployed successfully!"
echo "The app should be accessible at http://YOUR_EC2_PUBLIC_IP:3000"