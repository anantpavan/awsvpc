
/* Public subnet */
resource "aws_subnet" "public_subnets" {
  vpc_id                  = var.vpc_id
  count                   = length(var.availability_zones)
  cidr_block              = element(var.public_subnets_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
}


/* Routing table for public subnet */
resource "aws_route_table" "public" {
  vpc_id        =  var.vpc_id
}

resource "aws_route" "public_internet_gateway" {
route_table_id         =   aws_route_table.public.id
destination_cidr_block = "0.0.0.0/0"
gateway_id             =  var.igw_id

timeouts {
    create = "5m"
  }
}

/* Route table associations */
resource "aws_route_table_association" "public" {
  count          =  length(var.public_subnets_cidr)
  subnet_id      =   join(",", aws_subnet.public_subnets.*.id)
  route_table_id =  aws_route_table.public.id
}
