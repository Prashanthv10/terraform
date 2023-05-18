resource "aws_eip" "lb" {
  depends_on = [ module.ec2-public, module.vpc ]
  instance = module.ec2-public.id[0]
  vpc      = true
  tags = local.common_tags
}