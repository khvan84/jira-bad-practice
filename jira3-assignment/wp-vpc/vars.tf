variable "cidr_block" {
  description = "VPC CIDR Block"
  type = string
}

variable "enable_dns_support" {
  description = "Allow DNS support"
    type = bool
  
}

variable "enable_dns_hostnames" {
  description = "Allow DNS hostnames"
type = bool  
}
variable "wordpress_vpc" {
  description = "Name Tag"
  type = string
}