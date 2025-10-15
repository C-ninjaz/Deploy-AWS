#!/bin/bash
# EC2 User Data Script - Use this if you can restart your EC2 instance

# Update system
apt update -y

# Install Node.js 18
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

# Create app directory
mkdir -p /var/www/nodejs-app
cd /var/www/nodejs-app

# Create the application files
cat > package.json << 'EOF'
{
  "name": "nodejs-aws-app",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
    "express": "^4.18.2",
    "dotenv": "^16.3.1"
  }
}
EOF

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

cat > solution.js << 'EOF'
export const AWS_LINK = "";
export const PORT = 3000;
EOF

cat > server.js << 'EOF'
import server from "./app.js";
import { PORT } from "./solution.js";

server.listen(PORT, "0.0.0.0", () => {
  console.log(`server is running on port ${PORT}`);
});
EOF

# Install dependencies
npm install

# Start the application (use PM2 for production)
npm install -g pm2
pm2 start server.js --name nodejs-app
pm2 startup
pm2 save

# Open firewall
ufw allow 3000