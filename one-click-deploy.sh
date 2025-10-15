#!/bin/bash

echo "🚀 Starting AWS EC2 Deployment for Node.js App"
echo "=============================================="

# Update system packages
echo "📦 Updating system packages..."
sudo apt update -y

# Install Node.js 18.x
echo "📦 Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Create app directory
echo "📁 Creating application directory..."
mkdir -p ~/nodejs-app
cd ~/nodejs-app

# Create package.json
echo "📄 Creating package.json..."
cat > package.json << 'EOF'
{
  "name": "finaltest",
  "version": "1.0.0",
  "type": "module",
  "main": "server.js",
  "scripts": {
    "test": "jest",
    "start": "node server.js",
    "dev": "nodemon server.js"
  },
  "dependencies": {
    "express": "^4.18.2",
    "dotenv": "^16.3.1"
  }
}
EOF

# Create app.js
echo "📄 Creating app.js..."
cat > app.js << 'EOF'
import dotenv from "dotenv";
import express from "express";
dotenv.config();
const app = express();

app.get("/", (req, res) => {
  res.send("Hurray! I have successfully deployed this application on AWS.");
});

export default app;
EOF

# Create solution.js
echo "📄 Creating solution.js..."
cat > solution.js << 'EOF'
export const AWS_LINK = "";
export const PORT = 3000;
EOF

# Create server.js
echo "📄 Creating server.js..."
cat > server.js << 'EOF'
import server from "./app.js";
import { PORT } from "./solution.js";

server.listen(PORT, "0.0.0.0", () => {
  console.log(`server is running on port ${PORT}`);
});
EOF

# Install dependencies
echo "📦 Installing Node.js dependencies..."
npm install

# Configure firewall
echo "🔐 Configuring firewall..."
sudo ufw allow 3000 2>/dev/null || echo "Firewall configuration skipped"

# Get public IP
echo "🌐 Getting public IP address..."
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
echo "Your EC2 Public IP: $PUBLIC_IP"

# Start the application
echo "🚀 Starting the application..."
echo "The app will be available at: http://$PUBLIC_IP:3000"
echo ""
echo "Starting server..."
npm start