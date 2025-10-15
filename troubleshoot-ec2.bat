@echo off
echo ==============================================
echo EC2 Instance Troubleshooting Guide
echo Instance ID: i-033f6c10f848124c3
echo ==============================================

echo.
echo Step 1: Check Instance Status
echo -----------------------------
echo Go to AWS Console: https://console.aws.amazon.com/ec2/
echo Find your instance: i-033f6c10f848124c3
echo Check the following:
echo   - Instance State: Should be "running" (green)
echo   - Status Checks: Should be "2/2 checks passed"
echo   - Public IPv4 DNS: Should have a value
echo   - Public IPv4 address: Should have a value

echo.
echo Step 2: Fix Common Issues
echo -------------------------
echo If instance is STOPPED:
echo   1. Select the instance
echo   2. Click "Instance state" -> "Start instance"
echo   3. Wait for it to reach "running" state

echo.
echo If Status Checks are failing:
echo   1. Select the instance
echo   2. Click "Actions" -> "Monitor and troubleshoot" -> "Reboot instance"

echo.
echo Step 3: Security Group Configuration
echo ------------------------------------
echo 1. Click on your instance
echo 2. Go to "Security" tab
echo 3. Click on the security group link
echo 4. Ensure these inbound rules exist:
echo    - SSH (22) from Your IP or 0.0.0.0/0
echo    - Custom TCP (3000) from 0.0.0.0/0

echo.
echo Step 4: Alternative Connection Methods
echo -------------------------------------
echo Try these in order:
echo.
echo A) Session Manager (No SSH required):
echo    1. In EC2 console, select your instance
echo    2. Click "Connect"
echo    3. Choose "Session Manager" tab
echo    4. Click "Connect"
echo.
echo B) EC2 Instance Connect with different browser:
echo    - Try Chrome, Firefox, or Edge
echo    - Disable browser extensions
echo    - Clear browser cache
echo.
echo C) Use AWS CloudShell:
echo    1. In AWS Console, click CloudShell icon (terminal icon in top bar)
echo    2. Wait for CloudShell to start
echo    3. Run deployment commands there

pause