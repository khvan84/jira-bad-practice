
variable "wordpress_igw_name" {
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

variable "wp_sg_name" {
  type = string
}

variable "wp_sg_description" {
  type = string
}

variable "protocol_type" {
  type = string
}
variable "sg_cidr_block" {
  type = list(string)
}


#variable "public_key" {}


variable "key_name" {
  type = string
}

variable "instance_type" {

}

variable "ec2_name" {
  
}

variable "most_recent" {
  type = bool
}

variable "virtualization_type" {
  type =string
}

