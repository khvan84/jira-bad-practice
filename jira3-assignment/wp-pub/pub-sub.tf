resource "aws_subnet" "pub-subnet" {
  for_each = toset(var.subnet_cidr_blocks)
  vpc_id   = var.vpc_idss

  cidr_block              = each.value
  availability_zone       = element(var.availability_zones, index(var.subnet_cidr_blocks, each.value))
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "${var.pub_subnet_name}-${each.key}"
  }
}
