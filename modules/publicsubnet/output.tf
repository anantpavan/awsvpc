output "public_subnet" {
  value = join(",", aws_subnet.public_subnets.*.id)
}