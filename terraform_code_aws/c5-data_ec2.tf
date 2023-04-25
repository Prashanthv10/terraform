resource "aws_instance" "ec2" {
 # ami           = data.aws_ami.amznlnx.image_id
  ami           = "ami-05f998315cca9bfe3"
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.vpc-web.id, aws_security_group.vpc-ssh.id ]
  tags = {
    "Name" = "ec2p"
  }
}
