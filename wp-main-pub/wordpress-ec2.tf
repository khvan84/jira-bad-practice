data "aws_ami" "ami_version" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "wordpress-ec2" {
  subnet_id              = aws_subnet.pub-subnet["10.0.1.0/24"].id
  ami                    = data.aws_ami.ami_version.id
  key_name               = "linuxkey"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_multiports_wordpress_sg.id]

  tags = {
    Name = "wordpress-ec2"
  }

}

# resource "aws_key_pair" "deployer" {
#   key_name   = var.key_name
#   public_key = var.public_key

# }
