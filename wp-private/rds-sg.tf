resource "aws_security_group" "rds-sg" {
  name = var.db_sg_names
  description = var.sg_description
  vpc_id      = var.vpc_ids
  
  tags = {
      Name = var.db_sg_names
  
  }
  ingress {
    
      from_port   = var.port
      to_port     = var.port
      protocol    = var.protocol_type
      security_groups = [var.security_groups]
  }
  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"] 
  }
      
}