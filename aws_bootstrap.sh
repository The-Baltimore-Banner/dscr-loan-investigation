#!/bin/bash

# Minimal AWS CLI Bootstrap Script for macOS
# Installs AWS CLI if needed and sources existing .aws_env file

set -e  # Exit immediately if a command exits with a non-zero status

echo "=== Minimal AWS CLI Bootstrap Script ==="

# Install AWS CLI if not already installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI not found. Installing..."
    
    # Check if brew is installed
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    
    # Install AWS CLI via Homebrew
    brew install awscli
    
    # Verify installation
    aws --version
    if [ $? -eq 0 ]; then
        echo "AWS CLI installed successfully."
    else
        echo "AWS CLI installation failed!"
        exit 1
    fi
else
    echo "AWS CLI is already installed."
    aws --version
fi

# Source AWS environment variables from existing file
AWS_ENV_FILE="${AWS_ENV_FILE:-$HOME/.aws_env}"

if [ -f "$AWS_ENV_FILE" ]; then
    echo "Loading AWS credentials from $AWS_ENV_FILE..."
    source "$AWS_ENV_FILE"
    
    # Verify configuration
    aws sts get-caller-identity &> /dev/null
    if [ $? -eq 0 ]; then
        echo "✓ Successfully authenticated with AWS!"
    else
        echo "✗ Authentication failed. Please check your credentials."
        exit 1
    fi
else
    echo "AWS environment file not found at $AWS_ENV_FILE"
    echo "Please set up your AWS credentials file and try again."
    echo "Example format for .aws_env:"
    echo "export AWS_ACCESS_KEY_ID='your_access_key'"
    echo "export AWS_SECRET_ACCESS_KEY='your_secret_key'"
    echo "export AWS_DEFAULT_REGION='us-east-1'"
    exit 1
fi

echo "=== Bootstrap Complete ==="