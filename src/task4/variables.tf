## MANDATORY VARIABLES ##


## OPTIONAL PARAMETERS ##

variable "main_vpc_cidr" {
  description = "The CIDR of the main VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR of public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "The CIDR of the private subnet"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "tag_name" {
  description = "A name used to tag the resource"
  type        = string
  default     = "terraform-interview-sre"
}


