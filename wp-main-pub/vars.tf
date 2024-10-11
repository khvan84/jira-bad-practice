variable "cidr_block" {
  type = string
}
variable "wordpress_igw_name" {
  type = string
}
variable "wordpress-vpc" {
  type = string
}
variable "wordpress-rt" {
  type = string
}

variable "igw_cidr_block" {
  type = string
}


variable "subnet_cidr_blocks" {
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

variable "pub_subnet_name" {
  type = string
}