@echo off
echo =============================================================
echo AWS EC2 Deployment Script for Instance: i-01cbda73e7d766c50
echo =============================================================

echo.
echo Step 1: Get your EC2 instance public IP
echo Go to AWS Console > EC2 > Instances
echo Find instance i-01cbda73e7d766c50 (Deploy My AWS)
echo Copy the Public IPv4 address

echo.
echo Step 2: Ensure Security Group allows port 3000
echo In EC2 console, go to Security Groups
echo Add inbound rule: Custom TCP, Port 3000, Source: 0.0.0.0/0

echo.
echo Step 3: Create deployment package
echo Creating deployment package...

if exist deployment-package rmdir /s /q deployment-package
mkdir deployment-package

copy app.js deployment-package\
copy server.js deployment-package\
copy solution.js deployment-package\
copy package.json deployment-package\
copy ecosystem.config.json deployment-package\
copy deploy.sh deployment-package\

echo Deployment package created in 'deployment-package' folder

echo.
echo Step 4: Upload files to EC2
echo Use SCP or WinSCP to upload the 'deployment-package' folder to your EC2 instance
echo Example SCP command (replace YOUR-KEY.pem and YOUR-PUBLIC-IP):
echo scp -i YOUR-KEY.pem -r deployment-package ubuntu@YOUR-PUBLIC-IP:/home/ubuntu/

echo.
echo Step 5: Connect to EC2 and run deployment
echo SSH to your instance:
echo ssh -i YOUR-KEY.pem ubuntu@YOUR-PUBLIC-IP
echo.
echo Then run these commands on the EC2 instance:
echo cd deployment-package
echo chmod +x deploy.sh
echo sudo ./deploy.sh

echo.
echo Step 6: Update solution.js with your EC2 public IP
echo After deployment, the app will be available at http://YOUR-PUBLIC-IP:3000
echo.
pause