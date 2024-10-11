module "wp-main-pub" {
  source  = "../wp-private"
  vpc_ids = aws_vpc.wp-vpc.id

  map_public_ip_on_launch = false
  pr_subnet_name          = "priv-subnet"

  pr_subnet_cidr_blocks = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24"
  ]
  availability_zones = [
    "us-east-1d",
    "us-east-1e",
    "us-east-1f"
  ]


}