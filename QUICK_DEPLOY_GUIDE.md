# 🚀 Quick Deployment Guide for EC2 Instance: i-01cbda73e7d766c50

## Method 1: Manual Upload and Deploy

### Step 1: Get Your EC2 Instance Details

1. Go to [AWS EC2 Console](https://console.aws.amazon.com/ec2/)
2. Find instance `i-01cbda73e7d766c50` (Deploy My AWS)
3. Note down the **Public IPv4 address** (something like `52.x.x.x`)

### Step 2: Configure Security Group

1. Click on your instance → Security tab → Security groups
2. Click on the security group link
3. Add Inbound Rule:
   - Type: Custom TCP
   - Port: 3000
   - Source: 0.0.0.0/0 (Anywhere)

### Step 3: Upload Files to EC2

**Option A: Using EC2 Instance Connect (Browser-based)**

1. In EC2 console, select your instance
2. Click "Connect" → "EC2 Instance Connect" → "Connect"
3. In the browser terminal, run:
   ```bash
   mkdir nodejs-app
   cd nodejs-app
   ```

**Option B: Using SSH (if you have the key pair)**

```bash
ssh -i your-key.pem ubuntu@YOUR-PUBLIC-IP
mkdir nodejs-app
cd nodejs-app
```

### Step 4: Create Files on EC2

Copy and paste each file content into the EC2 instance:

**Create package.json:**

```bash
cat > package.json << 'EOF'
{
  "name": "finaltest",
  "version": "1.0.0",
  "type": "module",
  "main": "index.js",
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
```

**Create app.js:**

```bash
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
```

**Create solution.js:**

```bash
cat > solution.js << 'EOF'
export const AWS_LINK = "";
export const PORT = 3000;
EOF
```

**Create server.js:**

```bash
cat > server.js << 'EOF'
import server from "./app.js";
import { PORT } from "./solution.js";

server.listen(PORT, "0.0.0.0", () => {
  console.log(`server is running on port ${PORT}`);
});
EOF
```

### Step 5: Install and Run

```bash
# Update system
sudo apt update

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install dependencies
npm install

# Start the application
npm start
```

### Step 6: Test and Update

1. Test in browser: `http://YOUR-PUBLIC-IP:3000`
2. Should show: "Hurray! I have successfully deployed this application on AWS."
3. Update `solution.js` with your public IP

## Method 2: One-Command Deploy Script

If you prefer a single script, run this on your EC2 instance:

```bash
curl -sSL https://raw.githubusercontent.com/YOUR-REPO/deploy.sh | bash
```

---

## 🎯 Next Steps After Deployment:

Once your app is running, update the `AWS_LINK` in your local `solution.js` file:

```javascript
export const AWS_LINK = "http://YOUR-PUBLIC-IP:3000";
```

Replace `YOUR-PUBLIC-IP` with the actual public IP of your EC2 instance.
