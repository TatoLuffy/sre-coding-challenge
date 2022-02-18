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
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "The CIDR of the private subnet"
  type        = string
  default     = "10.0.1.0/24"
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

variable "ami_ec2" {
    description = "Ami default Suse with apache"
    type        = string
    default     = "ami-08895422b5f3aa64a" # SUSE Linux Enterprise Server 15 SP3 (HVM), SSD Volume Type
}

variable "ami_ec2_type"{
    description = "Ami type"
    type        = string
    default     = "t2.micro" 
}
