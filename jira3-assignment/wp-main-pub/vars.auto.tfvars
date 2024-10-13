
wordpress_igw_name      = "wordpress_igw"
wordpress-rt            = "wordpress-rt"
igw_cidr_block          = "0.0.0.0/0"
map_public_ip_on_launch = true
subnet_cidr_blocks = [
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24"
]

availability_zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]

pub_subnet_name   = "pub-subnet"
sg_cidr_block     = ["0.0.0.0/0"]
wp_sg_name        = "Wordpress-EC2-SG"
wp_sg_description = "Allow HTTP/HTTPS, SSH traffic"
protocol_type     = "tcp"
key_name          = "linuxkey"
instance_type     = "t2.micro"
ec2_name = "wordpress-EC2"
most_recent = true
virtualization_type = "virtualization-type"
