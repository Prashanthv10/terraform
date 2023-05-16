module "ec2-private" {
  depends_on = [ module.VPC ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  # insert the 10 required variables here
  name = "${var.environment}-privateHost"
  
  #instance count is important because ec2 will be creating in both the sunets
  instance_count         = var.private_instance_count #imp 

  ami                    = ""
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  subnet_ids              = [                           #subnets_ids for multiple if it is one it should be subnets_id
    module.VPC.private_subnets[0],
    module.VPC.private_subnets[1]
  ]
  vpc_security_group_ids = [module.private-sg.this_security_group_id]
  user_data = file("${path.module}/app1-install.sh")
  tags = local.common_tags

}