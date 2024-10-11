resource "aws_vpc" "wp-vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.wordpress-vpc
  }
}