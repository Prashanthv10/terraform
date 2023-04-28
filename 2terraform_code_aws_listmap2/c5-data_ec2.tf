resource "aws_instance" "ec2" {
 # ami           = data.aws_ami.amznlnx.image_id
  ami           = "ami-05f998315cca9bfe3"
  #instance_type = var.instance_type # string variable
  #instance_type = var.instance_list[0] #0 or 1  for list
  instance_type = var.instance_map["dev"] #0 or 1  for list
  vpc_security_group_ids = [ aws_security_group.vpc-web.id, aws_security_group.vpc-ssh.id ]
  count = "2"
  tags = {
    "Name" = "ec2-${count.index}"
  }

  # tags = {
  #   "Name" = "ec2p"  #for single
  # }
}
