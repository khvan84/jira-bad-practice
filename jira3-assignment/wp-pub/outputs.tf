output "db-wp-sg-id" {
  value = aws_security_group.allow_multiports_wordpress_sg
}

output "EC-2_SG_ID" {
  value = aws_security_group.allow_multiports_wordpress_sg.id
}

output "subnet_ids" {
value =   [for subnet in aws_subnet.pub-subnet : subnet.id]
}