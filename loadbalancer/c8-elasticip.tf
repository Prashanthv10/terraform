resource "aws_eip" "lb" {
  depends_on = [ module.ec2-public, module.VPC ]
  instance = module.ec2-public.id
  vpc      = true
  tags = local.common_tags
}