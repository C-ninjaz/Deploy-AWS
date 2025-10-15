# AWS Deployment Guide

## Prerequisites

1. AWS Account
2. AWS CLI installed and configured
3. SSH key pair for EC2 access

## Deployment Steps

### Step 1: Launch EC2 Instance

1. Go to AWS Console > EC2
2. Click "Launch Instance"
3. Choose Ubuntu Server 22.04 LTS (Free Tier eligible)
4. Instance type: t2.micro (Free Tier)
5. Create or select a key pair for SSH access
6. Configure Security Group:
   - SSH (port 22) - Your IP
   - Custom TCP (port 3000) - Anywhere (0.0.0.0/0)
7. Launch the instance

### Step 2: Connect to EC2 Instance

```bash
ssh -i your-key.pem ubuntu@YOUR_EC2_PUBLIC_IP
```

### Step 3: Upload Application Files

Option 1 - Using SCP:

```bash
scp -i your-key.pem -r . ubuntu@YOUR_EC2_PUBLIC_IP:/home/ubuntu/nodejs-app
```

Option 2 - Using Git:

```bash
# On EC2 instance
git clone YOUR_REPOSITORY_URL
cd YOUR_REPOSITORY_NAME
```

### Step 4: Run Deployment Script

```bash
# On EC2 instance
chmod +x deploy.sh
sudo ./deploy.sh
```

### Step 5: Verify Deployment

```bash
# Check if PM2 is running the app
pm2 list

# Check application logs
pm2 logs nodejs-aws-app

# Test the endpoint
curl http://localhost:3000
```

### Step 6: Update solution.js

After successful deployment, update the AWS_LINK in solution.js with:

```javascript
export const AWS_LINK = "http://YOUR_EC2_PUBLIC_IP:3000";
```

## Troubleshooting

- Check security group settings if you can't access the app
- Verify EC2 instance is running
- Check PM2 logs for application errors
- Ensure port 3000 is open in firewall
