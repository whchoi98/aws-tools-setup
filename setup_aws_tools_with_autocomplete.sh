#!/bin/bash

# AWS 관리 도구 설치 스크립트 (eksctl 및 kubectl 제외)
# Shell script to install AWS management tools excluding eksctl and kubectl

# Amazon Linux 버전 확인
OS_VERSION=$(cat /etc/system-release)

echo "Detected OS: $OS_VERSION"

# 설치 명령어 설정
if [[ "$OS_VERSION" == *"Amazon Linux release 2"* ]]; then
    INSTALL_CMD="sudo yum install -y"
    UPDATE_CMD="sudo yum update -y"
elif [[ "$OS_VERSION" == *"Amazon Linux 2023"* ]]; then
    INSTALL_CMD="sudo dnf install -y"
    UPDATE_CMD="sudo dnf update -y"
else
    echo "Unsupported Amazon Linux version."
    exit 1
fi

# 시스템 업데이트
echo "Updating system..."
$UPDATE_CMD

# 기본 시스템 도구 설치
echo "Installing basic system tools..."
$INSTALL_CMD tcpdump git bash-completion sysstat strace lsof tree

# AWS CLI 설치
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install --update
rm -rf awscliv2.zip aws/
aws --version

# Terraform 설치
echo "Installing Terraform..."
$INSTALL_CMD yum-utils || $INSTALL_CMD dnf-plugins-core
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
$INSTALL_CMD terraform
terraform --version

# 기타 유용한 도구 설치
echo "Installing additional tools..."
$INSTALL_CMD jq rsync traceroute wget vim-enhanced nano

# rclone 설치
echo "Installing rclone..."
curl https://rclone.org/install.sh | sudo bash

# bashrc에 자동완성 설정 추가 (필요 시 활성화)
if ! grep -q "source /etc/profile.d/bash_completion.sh" ~/.bashrc; then
    echo "source /etc/profile.d/bash_completion.sh" >> ~/.bashrc
fi

# 설치 완료 메시지
echo "Setup complete! All tools have been installed successfully. 🎉"