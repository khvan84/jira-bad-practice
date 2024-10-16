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
  subnet_id              = var.subnet_id
  ami                    = data.aws_ami.ami_version.id
  key_name               = var.key_name
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.EC2_SG_ID]

  tags = {
    Name = var.ec2_name
  }

  user_data = var.user_data

}

# resource "aws_key_pair" "deployer" {
#   key_name   = var.key_name
#   public_key = var.public_key

# }
