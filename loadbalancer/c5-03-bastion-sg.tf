module "public-bastion-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"
  # insert the 2 required variables here
 
 name = "public-bastion-sg"
 vpc_id = module.vpc.vpc_id
 
 ingress_rules = ["ssh-tcp"]
 ingress_ipv6_cidr_blocks = ["0.0.0.0/0"]

 egress_rules = ["all-all"]

 tags = local.common_tags
 }

