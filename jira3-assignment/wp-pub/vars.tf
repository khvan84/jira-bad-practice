
variable "wordpress_igw_name" {
  description = "IGW Name"
  type = string
}

variable "wordpress-rt" {
  description = "Tag Name for Public RT"
  type = string
}

variable "igw_cidr_block" {
  description = "IGW CIDR Block, what traffic allowed to the internet"
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
  description = "Autoassign Public IP's to Instances created in the Subnet"
  type = bool
}

variable "pub_subnet_name" {
  description = "Public Subnet Name"
  type = string
}

variable "wp_sg_name" {
  description = "Name of the EC2 SG"
  type = string
}

variable "wp_sg_description" {
  description = "Description of EC2 SG"
  type = string
}

variable "protocol_type" {
  description = "Protocol Type For Ingress rule of EC2 SG"
  type = string
}
variable "sg_cidr_block" {
  description = "SG CIDR Block"
  type = list(string)
}

#variable "public_key" {}

variable "vpc_idss" {
  description = "VPC ID"
}