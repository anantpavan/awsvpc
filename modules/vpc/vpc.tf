/*==== The VPC ======*/
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
}


resource "aws_internet_gateway" "igw" {
  vpc_id = join("", aws_vpc.vpc.*.id)
}
