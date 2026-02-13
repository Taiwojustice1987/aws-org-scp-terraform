terraform {
  backend "s3" {
    bucket         = "taiwo-terraform-state-626635400294"
    key            = "aws-org-scp-terraform/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
