module "public-bastion-sg" {
  # depends_on = [ data.terraform_remote_state.vpc ]
  source  = "./modules/public-bastion-sg"

# version = "4.0.0"
# insert the 2 required variables here

# # name = "public-bastion-sg"
  # vpc_id = module.vpc.vpc_id
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

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