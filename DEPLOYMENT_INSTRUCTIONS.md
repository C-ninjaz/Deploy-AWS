# Complete AWS Deployment Guide

I've prepared your Node.js application for AWS deployment with two options:

## Option 1: AWS Lambda + API Gateway (Serverless) - RECOMMENDED

This is the easiest and most cost-effective option for this simple application.

### Prerequisites

1. AWS CLI installed and configured
2. Node.js installed locally

### Steps:

1. Install dependencies:

   ```cmd
   npm install
   npm install -g serverless
   ```

2. Configure AWS credentials (if not already done):

   ```cmd
   aws configure
   ```

3. Deploy to AWS Lambda:

   ```cmd
   serverless deploy
   ```

4. After successful deployment, you'll get an API Gateway URL like:

   ```
   https://xxxxxxxxxx.execute-api.us-east-1.amazonaws.com/prod/
   ```

5. Update solution.js with this URL:
   ```javascript
   export const AWS_LINK =
     "https://xxxxxxxxxx.execute-api.us-east-1.amazonaws.com/prod";
   ```

### To test locally before deployment:

```cmd
npm run dev
```

### To test the deployed Lambda:

```cmd
serverless invoke -f app
```

## Option 2: AWS EC2 Instance

If you prefer a traditional server setup, follow the AWS_DEPLOYMENT_GUIDE.md

### Quick EC2 Steps:

1. Launch Ubuntu EC2 instance (t2.micro for free tier)
2. Configure security group (allow SSH port 22 and HTTP port 3000)
3. Upload your code to the instance
4. Run the deployment script: `sudo ./deploy.sh`
5. Update solution.js with: `http://YOUR_EC2_PUBLIC_IP:3000`

## Files Created for Deployment:

- `lambda.js` - Lambda handler for serverless deployment
- `serverless.yml` - Serverless framework configuration
- `ecosystem.config.json` - PM2 configuration for EC2
- `deploy.sh` - EC2 deployment script
- `AWS_DEPLOYMENT_GUIDE.md` - Detailed EC2 deployment guide

## Next Steps:

1. Choose your deployment method (Lambda recommended)
2. Follow the deployment steps
3. Update the AWS_LINK in solution.js with your deployment URL
4. Test the endpoint to ensure it returns the expected response

The application is now ready for AWS deployment!
