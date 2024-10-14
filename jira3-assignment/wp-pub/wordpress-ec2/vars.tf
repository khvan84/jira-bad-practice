variable "most_recent" {
  description = "most recent version of AMI"
  type = bool
}

variable "virtualization_type" {
  description = "virtualization type"
  type = string
}

variable "key_name" {
  description = "EC2 key name for SSH"
  type = string
}

variable "instance_type" {
  description = "Instance Type"

}

variable "ec2_name" {
description = "Name of EC2"
}

variable "user_data" {
  description = "User Data for EC2"
}

variable "subnet_id" {
  description = "subnet ID"
}

variable "EC2_SG_ID" {
  description = "EC2 SG ID"
}