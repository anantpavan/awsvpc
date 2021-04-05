# Private security group
resource "aws_security_group" "private_sg" {
  name        = "private"
  description = "Security group to access private ports"
  vpc_id      =  var.vpc_id

 
  # allow SSH from bastion host
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0",
    ]

  }

  # allow RDP from bastion host
  ingress {
    from_port = 3389
    to_port   = 3389
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0",
    ]

  }


  # allow all outgoing traffic from private subnet
  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
   }
  }

# Public security group
resource "aws_security_group" "public_sg" {
  
  name        = "public"
  description = "Public access security group"
  vpc_id      =  var.vpc_id


  # allow https traffic
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = var.public_subnets_cidr
  }

  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
   }
  }
