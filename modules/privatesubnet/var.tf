variable "private_subnets_cidr" {
  default     = ["172.30.2.0/23"]
  type        = list(any)
  description = "private subnet CIDR blocks"
}


variable "vpc_id" {
}

variable "availability_zones" {
  default     = ["us-east-1a"]
  type        =  list
  description = "Availability zone 1 and 2"
}

