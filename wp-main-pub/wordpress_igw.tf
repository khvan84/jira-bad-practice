resource "aws_internet_gateway" "wordpress_igw" {
  vpc_id = aws_vpc.wp-vpc.id

  tags = {
    Name = var.wordpress_igw_name
  }
}