variable "pr_subnet_cidr_blocks" {
  description = "List of CIDR blocks for the subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of Availability Zones for the subnets"
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  description = "Autoassign Public IP to EC2 created in the subnet"
  type = bool
}

variable "pr_subnet_name" {
  description = "Name of the Private Subnet"
  type = string
}

variable "vpc_ids" {
  description = "VPC ID"
type = string
}

variable "rt_name" {
  description = "Name of the Database RT"
  type =string
}


variable "sg_description" {
  description = "Database SG description"
  type = string
}

variable "port" {
  description = "Allow Ingress/eggress rule port number"
  type = number
}

variable "protocol_type" {
  description = "Allow Ingress/Egress Protocol Type"
  type = string
}


variable "db_sg_names" {
  description = "DB SG Name"
  type = string
}

variable "security_groups" {}

variable "group_name" {
  description = "Database Subnet Group Name"
  type = string
}

variable "group_description" {
  description = "Database Subnet Group Description"
type = string
}

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

