cidr_block         = "10.0.0.0/16"
wordpress_igw_name = "wordpress_igw"
wordpress-vpc      = "wordpress-vpc"
wordpress-rt       = "wordpress-rt"
igw_cidr_block     = "0.0.0.0/0"

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


map_public_ip_on_launch = true
pub_subnet_name         = "pub-subnet"
