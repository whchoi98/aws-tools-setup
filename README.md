아래는 GitHub에서 바로 사용할 수 있도록 전체 내용을 Markdown 형식으로 작성한 README.md 파일입니다. 한글과 영어를 함께 포함하였습니다.

# AWS Tools Setup Script  
AWS 관리 도구 설치 스크립트

A shell script to automate the installation of AWS management tools and configure autocomplete for commands like `aws`, `eksctl`, and `kubectl`.  
`aws`, `eksctl`, `kubectl` 등의 명령어 자동완성을 설정하고 AWS 관리 도구를 자동으로 설치하는 쉘 스크립트입니다.

---

## Features / 주요 기능

- **Installs essential AWS management tools / 필수 AWS 관리 도구 설치:**
  - AWS CLI
  - eksctl
  - kubectl
  - Terraform
  - rclone
  - s3cmd

- **Configures autocomplete / 자동완성 설정:**
  - AWS CLI
  - eksctl
  - kubectl

- **Installs additional utilities for system monitoring, file management, and security / 시스템 모니터링, 파일 관리, 보안에 필요한 추가 유틸리티 설치.**

---

## Prerequisites / 사전 준비 사항

- **Amazon Linux 2 or Amazon Linux 2023**  
  Amazon Linux 2 또는 Amazon Linux 2023
- **Bash shell**  
  Bash 쉘

---

## Installation / 설치 방법

1. **Clone the repository / 레포지토리 클론**:
   ```bash
   git clone https://github.com/<your-username>/aws-tools-setup.git
   cd aws-tools-setup

	2.	Make the script executable / 스크립트 실행 권한 부여:

chmod +x setup_aws_tools_with_autocomplete.sh


	3.	Run the script / 스크립트 실행:

./setup_aws_tools_with_autocomplete.sh

Usage / 사용법
	•	After the script finishes, you can start using the installed tools / 스크립트 실행 후, 설치된 도구를 사용할 수 있습니다:
	•	aws: Manage AWS resources / AWS 리소스를 관리.
	•	eksctl: Manage Amazon EKS clusters / Amazon EKS 클러스터를 관리.
	•	kubectl: Operate Kubernetes clusters / Kubernetes 클러스터 작업.
	•	Autocomplete will be enabled for aws, eksctl, and kubectl / aws, eksctl, kubectl 명령의 자동완성이 활성화됩니다.

Included Tools / 포함된 도구
	•	AWS CLI: Command-line interface for AWS services / AWS 서비스를 위한 명령줄 인터페이스.
	•	eksctl: CLI for creating and managing EKS clusters / EKS 클러스터를 생성 및 관리하는 CLI.
	•	kubectl: Kubernetes CLI / Kubernetes 명령줄 도구.
	•	Terraform: Infrastructure as Code (IaC) tool / 코드형 인프라(IaC) 도구.
	•	rclone: Manage cloud storage / 클라우드 스토리지를 관리.
	•	s3cmd: CLI for Amazon S3 / Amazon S3 명령줄 도구.

Customization / 사용자 정의
	•	You can modify the script to include or exclude specific tools by commenting out sections in the script.
스크립트의 특정 섹션을 주석 처리하여 도구를 포함하거나 제외할 수 있습니다.

Contributing / 기여하기

Contributions are welcome! Submit a pull request or open an issue for improvements or suggestions.
기여는 언제나 환영합니다! 개선 사항이나 제안이 있다면 풀 리퀘스트를 제출하거나 이슈를 열어주세요.

License / 라이선스

This project is licensed under the MIT License.
이 프로젝트는 MIT 라이선스에 따라 제공됩니다.

Author / 작성자

Created by Your Name
작성자: Your Name

---

### **Markdown 저장 및 사용**
1. 위 내용을 복사하여 `README.md` 파일로 저장합니다:
   ```bash
   nano README.md

	2.	GitHub에 업로드:

git add README.md
git commit -m "Add bilingual README.md"
git push origin main



GitHub에서 README.md는 프로젝트 페이지의 첫 화면으로 표시되며, Markdown 형식은 GitHub에서 자동으로 렌더링됩니다.