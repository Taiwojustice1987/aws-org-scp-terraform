output "root_scp_id" {
  value = aws_organizations_policy.root_scp.id
}

output "dev_scp_id" {
  value = aws_organizations_policy.dev_scp.id
}
