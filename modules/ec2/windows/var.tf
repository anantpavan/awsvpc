variable "private_subnet" {
}

variable "private_sg" {
}

variable "public_sg" {
}

variable "instance_count" {
default     = "1"
}

variable "ami_id" {
  default     = "ami-0c03e60a1ca66848d"
  type        = string
  description = "AMI ID"
}

variable "instance_type"  {
  default     = "t2.micro"
  type        = string
  description = "AMI ID"
}