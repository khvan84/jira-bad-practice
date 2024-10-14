output "db-wp-sg-id" {
  value = aws_security_group.allow_multiports_wordpress_sg
}

output "EC2_Availability_Zone" {
  value = aws_instance.wordpress-ec2.availability_zone
}

output "public_ip" {
  value = aws_instance.wordpress-ec2.public_ip
}

output "private_ip" {
  value = aws_instance.wordpress-ec2.private_ip
}

output "EC2_public_DNS" {
  value = aws_instance.wordpress-ec2.public_dns
}

output "EC-2_SG_ID" {
  value = aws_security_group.allow_multiports_wordpress_sg.id
}
