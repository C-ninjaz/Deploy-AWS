# AWS Node.js Deployment Project

A simple Node.js Express application designed for deployment on AWS using multiple deployment strategies including Lambda, EC2, and serverless configurations.

## 📋 Project Overview

This project demonstrates how to deploy a Node.js application on AWS infrastructure. The application is a basic Express.js server that returns a success message when accessed, designed specifically as a learning exercise for AWS deployment practices.

## 🚀 Features

- **Express.js Server**: Simple HTTP server with a root endpoint
- **Multiple Deployment Options**: EC2, Lambda, and serverless configurations
- **Environment Configuration**: Configurable port and AWS link settings
- **Automated Deployment Scripts**: Ready-to-use deployment automation
- **Comprehensive Documentation**: Step-by-step deployment guides

## 📁 Project Structure

```
problem/
├── app.js                      # Main Express application
├── server.js                   # Server entry point
├── solution.js                 # Configuration (AWS_LINK, PORT)
├── package.json                # Dependencies and scripts
├── serverless.yml              # Serverless framework configuration
├── ecosystem.config.json       # PM2 configuration
├── lambda.js                   # Lambda function handler
├── deploy.sh                   # Linux deployment script
├── deploy-to-ec2.bat          # Windows EC2 deployment script
├── one-click-deploy.sh        # Automated deployment script
├── user-data-script.sh        # EC2 user data initialization
├── troubleshoot-ec2.bat       # EC2 troubleshooting script
└── deployment-package/        # Packaged deployment files
```

## 🛠️ Installation

### Prerequisites

- Node.js (v14 or higher)
- npm or yarn
- AWS CLI configured
- AWS account with appropriate permissions

### Local Setup

1. **Clone the repository**:

   ```bash
   git clone <repository-url>
   cd "Deploy on AWS/problem"
   ```

2. **Install dependencies**:

   ```bash
   npm install
   ```

3. **Run locally**:

   ```bash
   npm start
   # or for development
   npm run dev
   ```

4. **Test the application**:
   ```bash
   curl http://localhost:3000
   # Expected response: "Hurray! I have successfully deployed this application on AWS."
   ```

## ☁️ Deployment Options

### Option 1: AWS Lambda + API Gateway (Recommended)

**Best for**: Serverless, cost-effective, automatic scaling

1. **Install Serverless Framework**:

   ```bash
   npm install -g serverless
   ```

2. **Deploy**:

   ```bash
   serverless deploy
   ```

3. **Update solution.js** with the provided API Gateway URL

### Option 2: EC2 Deployment

**Best for**: Full control, traditional hosting, persistent connections

#### For Linux/Mac:

```bash
chmod +x deploy.sh
./deploy.sh
```

#### For Windows:

```cmd
deploy-to-ec2.bat
```

#### Manual EC2 Setup:

1. Launch an EC2 instance (Amazon Linux 2)
2. Connect via SSH
3. Run the user data script or manual setup:

   ```bash
   # Install Node.js and dependencies
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
   source ~/.bashrc
   nvm install node

   # Clone and setup application
   git clone <your-repo>
   cd problem
   npm install
   npm start
   ```

### Option 3: One-Click Deployment

Use the automated deployment script:

```bash
chmod +x one-click-deploy.sh
./one-click-deploy.sh
```

## 🔧 Configuration

### Environment Variables

Configure your deployment in `solution.js`:

```javascript
export const AWS_LINK = "http://your-aws-endpoint:3000";
export const PORT = 3000;
```

### Serverless Configuration

Modify `serverless.yml` for custom settings:

- AWS region
- Runtime version
- Memory allocation
- Timeout settings

### PM2 Configuration

For EC2 deployments, PM2 configuration is in `ecosystem.config.json`:

```json
{
  "apps": [
    {
      "name": "aws-deployment-app",
      "script": "server.js",
      "instances": "max",
      "exec_mode": "cluster"
    }
  ]
}
```

## 📚 Documentation

- [`AWS_DEPLOYMENT_GUIDE.md`](./AWS_DEPLOYMENT_GUIDE.md) - Comprehensive AWS deployment guide
- [`DEPLOYMENT_INSTRUCTIONS.md`](./DEPLOYMENT_INSTRUCTIONS.md) - Step-by-step deployment instructions
- [`QUICK_DEPLOY_GUIDE.md`](./QUICK_DEPLOY_GUIDE.md) - Quick start deployment guide
- [`ProblemStatement.md`](./ProblemStatement.md) - Original project requirements

## 🧪 Testing

Run the test suite:

```bash
npm test
```

Verify deployment:

```bash
curl <your-aws-endpoint>
# Should return: "Hurray! I have successfully deployed this application on AWS."
```

## 🛠️ Troubleshooting

### Common Issues

1. **Port conflicts**: Ensure port 3000 is available and security groups allow inbound traffic
2. **AWS credentials**: Verify AWS CLI is configured correctly
3. **Dependencies**: Run `npm install` after any changes

### EC2 Troubleshooting

Use the provided troubleshooting script:

```cmd
troubleshoot-ec2.bat
```

### Debug Commands

```bash
# Check application logs
pm2 logs

# Check process status
pm2 status

# Restart application
pm2 restart all
```

## 📦 Dependencies

### Production Dependencies

- `express` - Web framework
- `dotenv` - Environment variable management
- `serverless-http` - Lambda integration
- `archiver` - File compression
- `axios` - HTTP client

### Development Dependencies

- `jest` - Testing framework
- `serverless` - Serverless framework
- `serverless-offline` - Local development
- `nodemon` - Development server

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the ISC License.

## 📧 Support

For issues and questions:

1. Check the troubleshooting section
2. Review the deployment guides
3. Open an issue in the repository

---

**Note**: Remember to update the `AWS_LINK` constant in `solution.js` after successful deployment with your actual AWS endpoint URL.
