resource "aws_eip" "lb" {
  depends_on = [ module.ec2-public, module.VPC ]
  instance = aws_instance.web.id
  vpc      = true
  tags = local.common_tags
}