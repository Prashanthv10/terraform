resource "aws_instance" "ec2" {
  ami           = data.aws_ami.amznlnx.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ "aws_security_group.vpc-web.id, aws_security_group.vpc-ssh.id" ]
  tags = {
    "name" = "ec2p"
  }
}
