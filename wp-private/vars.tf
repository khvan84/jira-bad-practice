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