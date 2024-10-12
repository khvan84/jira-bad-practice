output "vpc_id" {
  value = aws_vpc.wp-vpc
}

output "db-wp-sg-id" {
  value = aws_security_group.allow_multiports_wordpress_sg
}

