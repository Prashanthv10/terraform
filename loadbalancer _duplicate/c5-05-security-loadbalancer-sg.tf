module "loadbalancer-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"
  # insert the 2 required variables here
  name        = "loadbalancer-sg"
  description = "Security group with http port open for everybody"
  vpc_id      = module.VPC.vpc_id

  ingress_cidr_blocks      = ["0.0.0.0/0"]
  ingress_rules            = ["https-80-tcp"] # we can use 12th line syntax
  # ingress_rule = ["https-80-tcp", "https-81-tcp"]
  ingress_with_cidr_blocks = [
    {
        from_port   = 81
        to_port     = 81
        protocol    = "tcp"  #or6 intead of tcp
        description = "User-service ports"
        cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_rules = ["all-all"]
  tags = local.common_tags

}