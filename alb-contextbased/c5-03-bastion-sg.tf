module "public-bastion-sg" {
  source  = "./modules/public-bastion-sg"

# version = "4.0.0"
# insert the 2 required variables here

# # name = "public-bastion-sg"
  vpc_id = odule.vpc.vpc_id

# tags = local.common_tags
 }

#  module "public-bastion-sg" {
#   source  = "./modules/public-bastion-sg"

# # version = "4.0.0"
# # insert the 2 required variables here

# # # name = "public-bastion-sg"
#   vpc_id = module.vpc.vpc_id

# # tags = local.common_tags
#  }