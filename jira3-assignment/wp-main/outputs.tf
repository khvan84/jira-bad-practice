output "EC2_Availability_Zone" {
  value       = module.wp-ec2.EC2_Availability_Zone
  description = "EC2 Availability Zone: "
}
output "EC2_public_IP" {
  value       = module.wp-ec2.public_ip
  description = "EC2 Public IP: "
}
output "EC2_private_IP" {
  value       = module.wp-ec2.private_ip
  description = "EC2 Private IP: "
}

output "EC2_public_DNS" {
  value       = module.wp-ec2.EC2_public_DNS
  description = "EC2 Public DNS: "
}

output "vpc_name1" {
  value       = module.wordpress-vpc.vpc_name
  description = "VPC Name: "
}

output "vpc_id" {
  value       = module.wordpress-vpc.vpc_id
  description = "VPC ID: "
}

output "vpc_cidr_block" {
  value       = module.wordpress-vpc.vpc_cidr_block
  description = "VPC CIDR: "
}

output "DB_name" {
  value       = module.mysql.DB_Identifier
  description = "Database Identifier: "
}

output "DB_Group_name" {
  value       = module.mysql.DB_Group_name
  description = "Subnet Group Name: "
}

output "DB_Group_description" {
  value       = module.mysql.DB_Group_description
  description = "DB Subnet Group Description: "
}

