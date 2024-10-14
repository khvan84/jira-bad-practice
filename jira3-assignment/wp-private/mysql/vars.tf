variable "engine" {
  description = "Database Engine"
  type = string
}

variable "engine_version" {
  description = "Database Engine Version"
  type = string
}

variable "instance_class" {
  description = "Database EC2 type"
  type = string
}
variable "multi_az" {
  description = "Multi AZ"
  type = bool
}
variable "db_password" {
  description = "secret"
  type = string
  sensitive = true
}

variable "username" {
  description = "secret"
  type = string
  sensitive = true
}
variable "storage_encrypted" {
  description = "Storage Encryption"
  type = bool
}

variable "skip_final_snapshot" {
  description = "Skip Final Snapshot"
  type = bool
}
variable "db_name" {
  description = "Database Name"
  type = string
}
  variable "identifier" {
    description = "Database Identifier"
 type = string  
}

variable "group_name" {
  description = "Database Subnet Group Name"
  type = string
}

variable "group_description" {
  description = "Database Subnet Group Description"
type = string
}

variable "subnet_id" {
  description = "subnet ID"
}

variable "rds-sg_id" {
    description = "RDS SG ID output"
}