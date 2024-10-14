resource "aws_db_subnet_group" "rds-mysql-subnet-group" {
  name       = var.group_name
  description = var.group_description
  subnet_ids = values(aws_subnet.pr-subnet)[*].id

  tags = {
    Name = var.group_name
  }
}

resource "aws_db_instance" "example" {
  allocated_storage           = 20
  #auto_minor_version_upgrade  = false                                  # Custom for SQL Server does not support minor version upgrades
  #custom_iam_instance_profile = "AWSRDSCustomSQLServerInstanceProfile" # Instance profile is required for Custom for SQL Server. See: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/custom-setup-sqlserver.html#custom-setup-sqlserver.iam
  #backup_retention_period     = 7
  db_name = var.db_name
  identifier = var.identifier
  db_subnet_group_name        = aws_db_subnet_group.rds-mysql-subnet-group.name # Copy the subnet group from the RDS Console
  engine                      = var.engine
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  multi_az                    = var.multi_az   #set as false, Multi AZ is not allowed with Free Tier
  password                    = var.db_password
  storage_encrypted           = var.storage_encrypted
  username                    = var.username
  skip_final_snapshot = var.skip_final_snapshot
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  
}
  
