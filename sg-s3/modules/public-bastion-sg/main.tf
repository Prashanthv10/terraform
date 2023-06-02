# data "terraform_remote_state" "vpc" {
#   backend = "s3"
#   config = {
#     bucket = "state-bucket-prash"
#     key = "dev/project1-vpc/terraform.tfstate"
#     region = "ap-southeast-2"

#     }
#   }
resource "aws_security_group" "bastion_sg" {
  depends_on = [ data.terraform_remote_state.vpc ]
  name        = "bastion_sg"
  description = "Allow inbound traffic"
  # vpc_id = var.vpc_id
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description      = "TLS from vpc"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }

}
