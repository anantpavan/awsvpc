module "new_vpc" {
  source = "./modules/vpc"
}

module "public_subnet" {
  source = "./modules/publicsubnet"

  vpc_id = module.new_vpc.vpc_id
  igw_id = module.new_vpc.igw_id
}

module "private_subnet" {
  source = "./modules/privatesubnet"

  vpc_id = module.new_vpc.vpc_id

}

module "security_group" {
  source = "./modules/sg"

  vpc_id = module.new_vpc.vpc_id
}

module "windows" {
  source = "./modules/ec2/windows"
  
  private_subnet  = module.private_subnet.private_subnet
  public_sg       = module.security_group.public_sg
  private_sg      = module.security_group.private_sg
}

module "linux" {
  source = "./modules/ec2/linux"

  private_subnet  =   module.private_subnet.private_subnet
  public_sg       =   module.security_group.public_sg
  private_sg      =   module.security_group.private_sg
}