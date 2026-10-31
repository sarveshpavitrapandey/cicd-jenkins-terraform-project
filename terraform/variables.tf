variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_id" {
  description = "Ubuntu 22.04 / 24.04 LTS AMI ID"
  type        = string
  default     = "ami-00bb6a80f01f03502" 
}

variable "key_name" {
  description = "AWS Key Pair Name"
  type        = string
  default     = "ansible-key"
}