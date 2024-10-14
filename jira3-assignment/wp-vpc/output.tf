output "vpc_output" {
  value = aws_vpc.wp-vpc
}

output "vpc_name" {
  value = aws_vpc.wp-vpc.tags_all
  description = "VPC Name: "
}

output "vpc_id" {
  value = aws_vpc.wp-vpc.id
  description = "VPC ID: "
}

output "vpc_cidr_block" {
  value = aws_vpc.wp-vpc.cidr_block
  description = "VPC CIDR: "
}