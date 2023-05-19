module "vpc" {
  source = "./modules/vpc"
  # version = "2.78.0"
    
    #vpc basic details
  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block

  azs             = var.vpc_availability_zones
  private_subnets = var.vpc_public_subnets
  public_subnets  = var.vpc_private_subnets

  #db sunets
  database_subnets = var.vpc_database_subnets
  create_database_subnet_group           = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  # NAT Gateways - Outbound Communication
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
    # vpc DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.common_tags
  vpc_tags = local.common_tags

    # Additional Tags to Subnets
  public_subnet_tags = {
    Type = "Public Subnets"
  }
    private_subnet_tags = {
    Type = "Private Subnets"
  }  
  database_subnet_tags = {
    Type = "Private Database Subnets"
  }
}

module "public-bastion-sg" {
  source  = "./modules/public-bastion-sg"

# version = "4.0.0"
# insert the 2 required variables here

# # name = "public-bastion-sg"
  vpc_id = module.vpc.vpc_id

# tags = local.common_tags
 }

 module "private-sg" {
  source  = "./modules/private-sg"
  # version = "4.0.0"
  # insert the 2 required variables here
 
  # # name = "private-sg"
  vpc_id = module.vpc.vpc_id

#  tags = local.common_tags
 }

