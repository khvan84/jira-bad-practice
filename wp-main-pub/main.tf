module "wp-main-pub" {
  source = "../wp-private"

  # terraform {
  # backend "s3" {
  #   bucket         = "class3-s3-bucket-021891614879"          # Replace with your bucket name
  #   key            = "~/vistudio/terraform/jira3-assignment/*.tfstate"    # Specify the path to your state file
  #   region         = "us-east-1"                   # Specify your AWS region
  #   encrypt        = true 

  vpc_ids                 = aws_vpc.wp-vpc.id
  map_public_ip_on_launch = false
  pr_subnet_name          = "priv-subnet"
  rt_name                 = "wordpress-db-rt"

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

  sg_cidr_block     = ["0.0.0.0/0"]
  security_groups   = aws_security_group.allow_multiports_wordpress_sg.id
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