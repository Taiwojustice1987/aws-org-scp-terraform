terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_organizations_policy" "root_scp" {
  name        = "PreventLeavingOrg"
  description = "Prevents member accounts from leaving the organization"
  content     = jsonencode(jsondecode(file("${path.module}/scp_root_policy.json")))
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "root_attach" {
  policy_id = aws_organizations_policy.root_scp.id
  target_id = var.root_target_id
}

resource "aws_organizations_policy" "dev_scp" {
  name        = "RestrictIAMServices"
  description = "Restricts IAM service usage in Dev OU"
  content     = jsonencode(jsondecode(file("${path.module}/scp_dev_policy.json")))
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "dev_attach" {
  policy_id = aws_organizations_policy.dev_scp.id
  target_id = var.dev_ou_id
}
