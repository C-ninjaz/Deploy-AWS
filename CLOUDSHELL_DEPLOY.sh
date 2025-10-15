# AWS CloudShell Deployment Commands
# Copy and paste these into AWS CloudShell

echo "🚀 Starting AWS CloudShell deployment..."

# Create a temporary directory for our app
mkdir nodejs-aws-app
cd nodejs-aws-app

# Create package.json
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
    "dotenv": "^16.3.1",
    "serverless-http": "^3.2.0"
  },
  "devDependencies": {
    "serverless": "^3.35.0"
  }
}
EOF

# Create app.js
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

# Create lambda.js for serverless deployment
cat > lambda.js << 'EOF'
import serverless from 'serverless-http';
import app from './app.js';

export const handler = serverless(app);
EOF

# Create serverless.yml
cat > serverless.yml << 'EOF'
service: nodejs-aws-deployment

provider:
  name: aws
  runtime: nodejs18.x
  region: us-east-1
  stage: prod

functions:
  app:
    handler: lambda.handler
    events:
      - http:
          path: /
          method: get
          cors: true
      - http:
          path: /{proxy+}
          method: any
          cors: true
EOF

# Install dependencies
npm install

# Install serverless globally
npm install -g serverless

# Deploy to AWS Lambda
echo "🚀 Deploying to AWS Lambda..."
serverless deploy

echo "✅ Deployment complete!"
echo "Your app URL will be shown above. Copy it and update your solution.js file."