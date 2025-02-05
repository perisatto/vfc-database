#outputs.tf
output "security_group_id" {
  value       = aws_security_group.rds_sg.id
}
output "db_instance_endpoint" {
  value       = aws_db_instance.menuguru.endpoint
}

output "db_customer_instance_endpoint" {
  value       = aws_db_instance.menuguru-customer.endpoint
}
