output "DB_Identifier" {
  value = aws_db_instance.example.identifier
  description = "Database Identifier: "
}

output "DB_Group_name" {
  value = aws_db_subnet_group.rds-mysql-subnet-group.name
  description = "Subnet Group Name: "
}

output "DB_Group_description" {
  value = aws_db_subnet_group.rds-mysql-subnet-group.description
  description = "DB Subnet Group Description: "
}