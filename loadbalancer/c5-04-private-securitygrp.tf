module "private-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"
  # insert the 2 required variables here
 
 name = "private-sg"
 vpc_id = module.VPC.vpc_id
 
 ingress_rules = ["ssh-tcp","http-80-tcp"]
 ingress_cidr_blocks = module.VPC.cidr#private ec2 instances are inside this sg so inbound rule applicable only for perticular vpc

 egress_rules = ["all-all"]

 tags = local.common_tags
 }

