variable "pr_subnet_cidr_blocks" {
  description = "List of CIDR blocks for the subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of Availability Zones for the subnets"
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  type = bool
}

variable "pr_subnet_name" {
  type = string
}

variable "vpc_ids" {
type = string
}

variable "rt_name" {
  type =string
}


variable "sg_description" {
  type = string
}

variable "port" {
  type = number
}

variable "protocol_type" {
  type = string
}

variable "sg_cidr_block" {
  type = list
}

variable "db_sg_names" {
  type = string
}

variable "security_groups" {}

variable "group_name" {
  type = string
}

variable "group_description" {
type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}
variable "multi_az" {
  type = bool
}
variable "db_password" {
  type = string
  sensitive = true
}

variable "username" {
  type = string
  sensitive = true
}
variable "storage_encrypted" {
  type = bool
}

variable "skip_final_snapshot" {
  type = bool
}
variable "db_name" {
  type = string
}
  variable "identifier" {
 type = string 
  
}