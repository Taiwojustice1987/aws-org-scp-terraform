# AWS Organizations SCP Governance Automation (Terraform + CI/CD)

## Overview

This project implements centralized AWS governance controls using Service Control Policies (SCPs) managed through Terraform Infrastructure-as-Code (IaC) and automated via GitHub Actions CI/CD.

The objective was to eliminate manually configured organizational policies and transition to a secure, version-controlled, and automated policy management framework aligned with enterprise DevSecOps best practices.

---

## Problem Statement

Two Service Control Policies were originally deployed manually through the AWS Console:

1. A policy at the Root OU preventing member accounts from leaving the organization.
2. A policy at the Dev OU restricting IAM service usage.

Manual policy management introduces:
- Configuration drift
- Lack of version control
- Limited auditability
- Operational risk

This project resolves those issues by redeploying SCPs using Terraform and integrating automated CI/CD workflows.

---

## Architecture

The solution includes:

- AWS Organizations SCP management
- Terraform Infrastructure-as-Code
- Remote S3 backend for centralized state management
- DynamoDB table for state locking and concurrency control
- GitHub Actions CI/CD automation
- Secure secret management using GitHub Secrets

---

## Implemented Policies

### 1️⃣ PreventLeavingOrg (Root OU)
Prevents member accounts from executing:


### 2️⃣ RestrictIAMServices (Dev OU)
Denies all IAM service actions within the Dev organizational unit.

---

## Security & Governance Controls Enforced

- Centralized AWS governance
- Policy lifecycle management via Git version control
- Infrastructure state integrity using S3 backend
- Concurrency protection via DynamoDB locking
- Secure CI/CD credential handling
- Idempotent Terraform deployments
- Drift prevention and automated reconciliation

---

## CI/CD Workflow

The GitHub Actions pipeline performs:

1. Terraform initialization (remote backend)
2. Configuration validation
3. Plan generation
4. Secure policy deployment
5. State reconciliation

All policy updates are:

- Version-controlled
- Auditable
- Reproducible
- Securely executed

---

## Terraform Backend Configuration

- **S3 Bucket:** `taiwo-terraform-state-626635400294`
- **State Key:** `aws-org-scp-terraform/terraform.tfstate`
- **DynamoDB Table:** `terraform-state-lock`

This enables shared state across local and CI environments with locking to prevent race conditions.

---

## Outcome

- Successfully removed manually configured SCPs.
- Redeployed policies using Terraform.
- Automated deployment through CI/CD pipeline.
- Verified idempotent execution (`No changes detected`).
- Established enterprise-ready governance automation.

---

## Repository Structure
├── main.tf
├── variables.tf
├── outputs.tf
├── scp_root_policy.json
├── scp_dev_policy.json
├── backend.tf
└── .github/workflows/deploy-scps.yml


---

## Skills Demonstrated

- AWS Organizations Governance
- Service Control Policy Management
- Terraform IaC
- Remote State Management (S3 + DynamoDB)
- CI/CD Automation (GitHub Actions)
- Secure Secret Handling
- Infrastructure Idempotency
- Drift Prevention

---

## Author

Taiwo Justice Olorunlana  
Cloud Security | DevSecOps | Infrastructure Automation
