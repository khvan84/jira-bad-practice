output "db-wp-sg-id" {
  value = aws_security_group.allow_multiports_wordpress_sg
}



output "EC2_Availability_Zone" {
  value       = aws_instance.wordpress-ec2.availability_zone
  description = "EC2 Availability Zone: "
}
output "EC2_public_IP" {
  value       = aws_instance.wordpress-ec2.public_ip
  description = "EC2 Public IP: "
}
output "EC2_private_IP" {
  value       = aws_instance.wordpress-ec2.private_ip
  description = "EC2 Private IP: "
}

output "EC2_public_DNS" {
  value       = aws_instance.wordpress-ec2.public_dns
  description = "EC2 Public DNS: "
}

 output "vpc_name1" {
  value = module.wordpress-vpc.vpc_name1
  description = "VPC Name: "
}

output "vpc_id" {
  value = module.wordpress-vpc.vpc_id
  description = "VPC ID: "
}

output "vpc_cidr_block" {
  value = module.wordpress-vpc.vpc_cidr_block
  description = "VPC CIDR: "
}

output "DB_name" {
  value = module.wp-priv.DB_Identifier
  description = "Database Identifier: "
}

output "DB_Group_name" {
  value = module.wp-priv.DB_Group_name
      description = "Subnet Group Name: "
}

output "DB_Group_description" {
  value = module.wp-priv.DB_Group_description
  description = "DB Subnet Group Description: "
}