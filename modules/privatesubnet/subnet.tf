/* Private subnet */
resource "aws_subnet" "private_subnets" {
  vpc_id                  = var.vpc_id
  count                   = length(var.availability_zones)
  cidr_block              = element(var.private_subnets_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false
}

resource "aws_eip" "nat" {
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id =  join(",", aws_subnet.private_subnets.*.id)
}


/* Routing table for private subnet */
resource "aws_route_table" "private" {
 vpc_id         =  var.vpc_id
}

resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             =  aws_nat_gateway.ngw.id
}

resource "aws_route_table_association" "private" {
  count          =  length(var.private_subnets_cidr)
  subnet_id      =   join(",", aws_subnet.private_subnets.*.id)
  route_table_id =  aws_route_table.private.id
}

resource "aws_network_interface" "private" {
  subnet_id   = join(",", aws_subnet.private_subnets.*.id)

  tags = {
    Name = "primary_network_interface"
  }
}
