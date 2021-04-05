resource "tls_private_key" "windows" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "windows" {
  key_name   =  "winoperator"
  public_key = tls_private_key.windows.public_key_openssh
}

resource "aws_instance" "ec2-worker" {
  count         =  var.instance_count
  ami           =  var.ami_id
  instance_type =  var.instance_type
  key_name      =  aws_key_pair.windows.key_name
  subnet_id     =  element(split(",", var.private_subnet), 0) 
  vpc_security_group_ids = [ var.private_sg, var.public_sg ]
  tags = {
    Name  = "windows-${count.index + 1}"
  }
}
