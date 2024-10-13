data "aws_ami" "ami_version" {  
  most_recent = var.most_recent #AMI set for auto-renewal


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = var.virtualization_type
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "wordpress-ec2" {
  subnet_id              = aws_subnet.pub-subnet["10.0.1.0/24"].id
  ami                    = data.aws_ami.ami_version.id
  key_name               = var.key_name
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_multiports_wordpress_sg.id]

  tags = {
    Name = var.ec2_name
  }

 user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y mysql
              sudo yum install -y httpd
              sudo service httpd start
              
              EOF


}

# resource "aws_key_pair" "deployer" {
#   key_name   = var.key_name
#   public_key = var.public_key

# }
