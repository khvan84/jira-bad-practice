resource "aws_internet_gateway" "wordpress_igw" {
  vpc_id = var.vpc_idss

  tags = {
    Name = var.wordpress_igw_name
  }
}