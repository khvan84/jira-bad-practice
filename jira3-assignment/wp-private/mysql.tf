resource "aws_db_subnet_group" "rds-mysql-subnet-group" {
  name       = var.group_name
  description = var.group_description
  subnet_ids = values(aws_subnet.pr-subnet)[*].id

  tags = {
    Name = var.group_name
  }
}

# Lookup the available instance classes for the custom engine for the region being operated in
# data "aws_rds_orderable_db_instance" "custom-sqlserver" {
#   engine                     = "custom-sqlserver-se" # CEV engine to be used
#   engine_version             = "15.00.4249.2.v1"     # CEV engine version to be used
#   storage_type               = "gp3"
#   preferred_instance_classes = ["db.r5.xlarge", "db.r5.2xlarge", "db.r5.4xlarge"]
# }

# The RDS instance resource requires an ARN. Look up the ARN of the KMS key.
# data "aws_kms_key" "by_id" {
#   key_id = "example-ef278353ceba4a5a97de6784565b9f78" # KMS key
# }

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
  multi_az                    = var.multi_az   #false # Custom for SQL Server does support multi-az
  password                    = var.db_password
  storage_encrypted           = var.storage_encrypted
  username                    = var.username
  skip_final_snapshot = var.skip_final_snapshot
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  
}
  
