output "subnet_ids" {
value = values(aws_subnet.pr-subnet)[*].id   
}

output "rds-sg_ids" {
 value = aws_security_group.rds-sg
}


