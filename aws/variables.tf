variable "vpc_cidr" {
  description = "Value of the CIDR range for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Value of the name for the VPC"
  type        = string
  default     = "MyTestVPC"
}

variable "subnet_cidr" {
  description = "Value of the subnet cidr for the VPC"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_name" {
  description = "Value of the name for the VPC"
  type        = string
  default     = "MyTestSubnet"
}

variable "igw_name" {
  description = "Value of the Internet Gateway for the VPC"
  type        = string
  default     = "MyTestIGW"
}

variable "ec2_ami" {
  description = "Value of the AMI Id for the ec2 instance"
  type        = string
  default     = "ami-007868005aea67c56"
}

variable "ec2_name" {
  description = "Value of the name tag for the ec2 instance"
  type        = string
  default     = "MyTestEC2"
}