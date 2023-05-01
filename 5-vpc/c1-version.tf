terraform {
  // required_version = "~>0.14.3"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3"
    }
  }
}
provider "aws" {
  region = var.aws_region
}

/*
resource "aws_instance" "ec2" {
  ami           = "ami-05f998315cca9bfe3"
  instance_type = vsr.instance_type
  tags = {
    "Name" = "ec2p"
  }
}
*/