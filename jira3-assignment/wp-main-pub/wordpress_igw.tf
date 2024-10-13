resource "aws_internet_gateway" "wordpress_igw" {
  vpc_id = module.wordpress-vpc.vpc_output.id

  tags = {
    Name = var.wordpress_igw_name
  }
}