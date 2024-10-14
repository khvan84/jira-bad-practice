resource "aws_subnet" "pr-subnet" {
 for_each = toset(var.pr_subnet_cidr_blocks)
  vpc_id     = var.vpc_ids
  
  cidr_block = each.value
availability_zone = element(var.availability_zones, index(var.pr_subnet_cidr_blocks, each.value))
map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "${var.pr_subnet_name}-${each.key}"
  }
}
