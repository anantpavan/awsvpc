variable "public_subnets_cidr" {
  default     = ["172.30.0.0/23"]
  type        = list(any)
  description = "public subnet CIDR blocks"
}

variable "private_subnets_cidr" {
  default     = ["172.30.2.0/23"]
  type        = list(any)
  description = "private subnet CIDR blocks"
}

variable "vpc_id" {
  type = string
}