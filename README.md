
# CI/CD Pipeline Automation with Jenkins & Infrastructure as Code (Terraform)

## 📌 Project Overview
This project establishes an automated Continuous Integration and Continuous Deployment (CI/CD) pipeline using **Jenkins**, integrated with **Terraform** for Infrastructure as Code (IaC) provisioning on **Amazon Web Services (AWS)**.

The solution automates source code integration, linting/testing, Docker container creation, declarative AWS cloud infrastructure provisioning, and application deployment into production environments.

---

## 🏗️ Architecture & Pipeline Flow

```text
                                  +-----------------------+
                                  |   Developer Commit    |
                                  +-----------+-----------+
                                              |
                                              v
                                  +-----------------------+
                                  |   GitHub Repository   |
                                  +-----------+-----------+
                                              |
                                              v
                                  +-----------------------+
                                  |    Jenkins Server     |
                                  +-----------+-----------+
                                              |
     +-----------------+----------------------+-------------------+-----------------+
     |                 |                      |                   |                 |
     v                 v                      v                   v                 v
[1. Checkout]    [2. Unit Test]        [3. Docker Build]   [4. Terraform IaC]  [5. Deploy]
                                                                  |
                                                                  v
                                                        +------------------+
                                                        | AWS Infrastructure|
                                                        | (EC2 & Security) |
                                                        +------------------+

```

---

## 🛠️ Tech Stack & Prerequisites

* **Automation Server:** Jenkins
* **Infrastructure as Code:** Terraform v1.5+
* **Cloud Provider:** Amazon Web Services (AWS EC2, VPC Security Groups)
* **Containerization:** Docker Engine
* **Source Control:** Git / GitHub
* **Execution Environment:** WSL (Ubuntu 22.04 LTS) / Linux

---

## 📁 Repository Structure

```text
cicd-jenkins-terraform-project/
├── Jenkinsfile              # Declarative Jenkins CI/CD pipeline definition
├── app.js                   # Application source code
├── package.json             # Project metadata & dependencies
├── Dockerfile               # Container spec configuration
├── terraform/               # Infrastructure as Code configurations
│   ├── main.tf              # AWS Provider, Security Group, and EC2 resources
│   ├── variables.tf         # Input variable definitions
│   └── outputs.tf           # Provisioned infrastructure outputs
└── README.md                # Project documentation

```

---

## ⚙️ Infrastructure Configuration (Terraform)

### `terraform/main.tf` Key Highlights

* **AWS Provider:** Configured for region `ap-south-1` (Mumbai).
* **Security Group (`aws_security_group.jenkins_app_sg`):** Opens Inbound Port 22 (SSH) and Port 80 (HTTP).
* **Compute Instance (`aws_instance.app_server`):** Provisions an Ubuntu 22.04 LTS `t2.micro` instance attached to the security group.

---

## 🚀 Pipeline Workflow (Jenkinsfile)

The Jenkins pipeline executes through 5 continuous delivery stages:

1. **Checkout Code:** Pulls the latest commits from the main GitHub repository branch.
2. **Lint & Unit Test:** Installs Node.js dependencies and executes automated test suites.
3. **Build Artifact / Docker Image:** Compiles and tags an immutable Docker container image using the Jenkins build number (`${BUILD_NUMBER}`).
4. **Infrastructure Provisioning (Terraform):** Runs `terraform init`, `terraform plan`, and `terraform apply -auto-approve` to ensure target AWS infrastructure is active.
5. **Deploy Application:** Deploys the built application artifact onto the provisioned AWS environment.

---

## 📊 Step-by-Step Execution Guide

### 1. Execute Terraform Locally (WSL/Linux)

```bash
# Navigate to terraform directory
cd terraform

# Initialize provider plugins
terraform init

# Review execution plan
terraform plan

# Provision AWS infrastructure
terraform apply -auto-approve

```

### 2. Verify Output

Upon successful completion, Terraform outputs the newly provisioned public IP address:

```text
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

ec2_public_ip = "13.233.x.x"
security_group_id = "sg-09fa403cda782ba8d"

```

---

## 🧹 Resource Cleanup

To destroy provisioned AWS resources and avoid unnecessary cloud charges after submission verification:

```bash
terraform destroy -auto-approve

```

---

**Author:** Sarvesh Pandey

**PRN:** 202301100037

**Course:** DevOps & Cloud Engineering

```

```
