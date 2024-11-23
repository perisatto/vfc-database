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

output "db_product_instance_endpoint" {
  value       = aws_db_instance.menuguru-product.endpoint
}

output "db_order_instance_endpoint" {
  value       = aws_db_instance.menuguru-order.endpoint
}

output "cluster_name" {
 value = mongodbatlas_cluster.test.name
 description = "Name of the MongoDB Atlas cluster"
}

output "project_id" {
 value = mongodbatlas_cluster.test.project_id
 description = "ID of the MongoDB Atlas project where the cluster resides"
}