output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "igw_id" {
  value       = join("", aws_internet_gateway.igw.*.id)
  description = "The ID of the Internet Gateway"
}