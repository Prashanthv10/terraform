module "private-sg" {
  source  = "./modules/security_grp_module_private"
  # version = "4.0.0"
  # insert the 2 required variables here
 
#  name = "private-sg"
  vpc_id = module.vpc.vpc_id

#  tags = local.common_tags
 }

