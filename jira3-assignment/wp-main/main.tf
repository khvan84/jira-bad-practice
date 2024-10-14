  # terraform {
  # backend "s3" {
  #   bucket         = "class3-s3-bucket-021891614879"          # Replace with your bucket name
  #   key            = "./*.tfstate"    # Specify the path to your state file
  #   region         = "us-east-1"                   # Specify your AWS region
  #   encrypt        = true 
module "wordpress-vpc" {
  source               = "../wp-vpc"
  cidr_block           = "10.0.0.0/16"
  wordpress_vpc        = "wordpress-vpc"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

module "wp-pub" {
vpc_idss = module.wordpress-vpc.vpc_id
source = "../wp-pub"

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
pub_subnet_name     = "pub-subnet"
sg_cidr_block       = ["0.0.0.0/0"]
wp_sg_name          = "Wordpress-EC2-SG"
wp_sg_description   = "Allow HTTP/HTTPS, SSH traffic"
protocol_type       = "tcp"
key_name            = "linuxkey"
instance_type       = "t2.micro"
ec2_name            = "wordpress-EC2"
most_recent         = true
virtualization_type = "virtualization-type"

user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y mysql
              sudo yum install -y httpd
              sudo service httpd start
              sudo amazon-linux-extras install -y mariadb10.5 php8.2
              sudo service httpd start
              EOF

}

module "wp-priv" {
  source = "../wp-private"

  vpc_ids                 = module.wordpress-vpc.vpc_output.id
  pr_subnet_name          = "priv-subnet"
  rt_name                 = "wordpress-db-rt"
  map_public_ip_on_launch = true
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
  security_groups   = module.wp-pub.EC-2_SG_ID
  sg_description    = "Security group for WP-Database"
  port              = 3306
  protocol_type     = "tcp"
  db_sg_names       = "rds-sg"
  group_name        = "rds-subnet-group"
  group_description = "Subnet group for RDS DB"

  engine              = "mysql"
  engine_version      = "8.0.35"
  instance_class      = "db.t3.micro"
  multi_az            = false
  username            = base64decode("YWRtaW4=")
  db_password         = base64decode("YWRtaW5hZG1pbg==")
  storage_encrypted   = true
  skip_final_snapshot = true
  db_name             = "wordpress"
  identifier          = "wordpress"

}