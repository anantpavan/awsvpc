variable "vpc_id" {
}

variable "public_subnets_cidr" {
  default     = ["172.30.0.0/23"]
  type        = list(any)
  description = "public subnet CIDR blocks"
}

variable "availability_zones" {
  default     = ["us-east-1a"]
  type        =  list
  description = "Availability zone 1 and 2"
}

variable "igw_id" {
  type = string
}
