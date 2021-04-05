output "private_subnet" {
  value = join(",", aws_subnet.private_subnets.*.id)
}