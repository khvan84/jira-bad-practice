resource "aws_security_group" "allow_multiports_wordpress_sg" {
  description = var.wp_sg_description
  vpc_id      = aws_vpc.wp-vpc.id
  name        = var.wp_sg_name
  dynamic "ingress" {
    for_each = toset([22, 80, 443])
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.protocol_type
      cidr_blocks = var.sg_cidr_block
    }
  }
  dynamic "egress" {
    for_each = toset([1])
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }



  }
  tags = {
    Name = var.wp_sg_name
  }
}