/*
data "aws_ami" "amznlnx" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = [" amzn2-ami-kernel-5.10-hvm-*-gp2"]
  }
  // (hvm) to take this take the ami and go to AMIs in amazon dash and search public image


  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
}
}
*/