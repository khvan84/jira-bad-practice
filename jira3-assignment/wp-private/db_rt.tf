resource "aws_route_table" "db_rt" {
  vpc_id = var.vpc_ids

tags = {
    Name = var.rt_name
  }
  
}
resource "aws_route_table_association" "pr_rt_sub" {
  for_each       = aws_subnet.pr-subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.db_rt.id
}

