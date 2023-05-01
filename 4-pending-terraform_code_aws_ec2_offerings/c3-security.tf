// security grp for ssh
resource "aws_security_group" "vpc-ssh" {
  name        = "vpc-ssh"
  description = "Allow vpc ssh"
  //vpc_id      = aws_vpc.main.id  (taking default vpc)

  ingress {
    description      = "allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   // ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    description      = "allow all ip"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "vpc-ssh"
  }
}

// sg for web (80,443)
resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  description = "Allow vpc web"
  //vpc_id      = aws_vpc.main.id  (taking default vpc)

  ingress {
    description      = "allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

// added one more inbound rule
 ingress {
    description      = "allow port 443"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description      = "allow all ip"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "vpc-web"
  }
}