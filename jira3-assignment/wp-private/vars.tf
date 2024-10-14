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





