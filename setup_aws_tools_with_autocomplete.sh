#!/bin/bash

# Amazon Linux 관리 도구 설치 및 자동완성 설정 스크립트
# Shell script to install management tools and configure autocomplete on Amazon Linux environments

# Amazon Linux 버전 확인
# Check Amazon Linux version
OS_VERSION=$(cat /etc/system-release)

echo "Detected OS: $OS_VERSION"

# Amazon Linux 2 및 2023 공통 설치 명령 설정
# Common install commands for Amazon Linux 2 and 2023
if [[ "$OS_VERSION" == *"Amazon Linux release 2"* ]]; then
    INSTALL_CMD="sudo yum install -y"
    GROUPINSTALL_CMD="sudo yum groupinstall -y"
    UPDATE_CMD="sudo yum update -y"
elif [[ "$OS_VERSION" == *"Amazon Linux 2023"* ]]; then
    INSTALL_CMD="sudo dnf install -y"
    GROUPINSTALL_CMD="sudo dnf groupinstall -y"
    UPDATE_CMD="sudo dnf update -y"
else
    echo "Unsupported Amazon Linux version."
    exit 1
fi

# 시스템 업데이트
# System update
echo "Updating system..."
$UPDATE_CMD

# 기본 시스템 도구 설치
# Install basic system tools
echo "Installing basic system tools..."
$INSTALL_CMD iotop iperf3 iptraf tcpdump git bash-completion \
htop sysstat atop dstat strace lsof tree ncdu

# 클라우드 및 AWS 도구 설치
# Install AWS and cloud tools
echo "Installing AWS CLI, eksctl, and kubectl..."
# AWS CLI 설치 및 자동완성 설정
# Install AWS CLI and configure autocomplete
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws/
aws --version

echo "Enabling AWS CLI autocomplete..."
complete -C '/usr/local/bin/aws_completer' aws
echo "complete -C '/usr/local/bin/aws_completer' aws" >> ~/.bashrc

# eksctl 설치 및 자동완성 설정
# Install eksctl and configure autocomplete
curl -LO "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz"
tar -xzf eksctl_$(uname -s)_amd64.tar.gz -C /usr/local/bin
rm -f eksctl_$(uname -s)_amd64.tar.gz
eksctl version

echo "Enabling eksctl autocomplete..."
eksctl completion bash > /etc/bash_completion.d/eksctl
source /etc/bash_completion.d/eksctl
echo "source /etc/bash_completion.d/eksctl" >> ~/.bashrc

# kubectl 설치 및 자동완성 설정
# Install kubectl and configure autocomplete
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client

echo "Enabling kubectl autocomplete..."
kubectl completion bash > /etc/bash_completion.d/kubectl
source /etc/bash_completion.d/kubectl
echo "source /etc/bash_completion.d/kubectl" >> ~/.bashrc

# Terraform 설치
# Install Terraform
echo "Installing Terraform..."
$INSTALL_CMD yum-utils || $INSTALL_CMD dnf-plugins-core
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
$INSTALL_CMD terraform

# 기타 유용한 도구 설치
# Install other useful tools
echo "Installing additional tools..."
$INSTALL_CMD nethogs iftop lnav nmon wireshark \
mc jq rsync nmap traceroute whois curl wget \
tig vim-enhanced nano buildah shellcheck fail2ban audit clamav fzf httpie s3cmd

# rclone 설치
# Install rclone
echo "Installing rclone..."
curl https://rclone.org/install.sh | sudo bash

# Python 패키지 및 awslogs 설치
# Install Python packages and awslogs
echo "Installing Python and required packages..."
$INSTALL_CMD python3-pip
pip3 install --upgrade pip
pip3 install boto3 requests awslogs

# bash-completion 활성화
# Enable bash-completion
echo "Enabling bash completion..."
source /etc/profile.d/bash_completion.sh
echo "source /etc/profile.d/bash_completion.sh" >> ~/.bashrc

# 자동완성 및 스크립트 적용
# Apply autocompletion and script settings
echo "Reloading bashrc to apply changes..."
source ~/.bashrc

# 설치 완료 메시지
# Installation complete message
echo "Setup complete! All tools and autocompletions are installed successfully. 🎉"