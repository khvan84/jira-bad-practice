resource "aws_route_table" "wp-rt" {
  vpc_id = var.vpc_idss

  route {
    cidr_block = var.igw_cidr_block
    gateway_id = aws_internet_gateway.wordpress_igw.id
  }

  tags = {
    Name = var.wordpress-rt
  }
}
resource "aws_route_table_association" "pub_rt_sub" {
  for_each       = aws_subnet.pub-subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.wp-rt.id
}