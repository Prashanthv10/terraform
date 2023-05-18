module "ec2-public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  # insert the 10 required variables here
  name = "${var.environment}-bastionHost"
#  instance_count         = 5

  ami                    = "ami-ebd02392"
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  monitoring             = true
  subnet_id              = module.vpc.public_subnets[0] #subnet_id is for single subnet
  vpc_security_group_ids = [module.public-bastion-sg.security_group_id]
  tags = local.common_tags

}