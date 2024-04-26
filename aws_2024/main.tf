provider "aws" {
	region = "us-east-1"
}
resource "aws_Instance" "example"{
	 instance_type = "var.instance_type"
	 ami = "var.ami"
 	 count = "1"
	 key_name = "pacha_lagin_key"
}
