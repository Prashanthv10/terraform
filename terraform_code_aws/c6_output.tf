output "public_ip" {
    description = "ec2publicip"
    value = "aws_instance.ec2.public_ip"
}
output "public_dns" {
    description = "ec2dns"
    value = "aws_instance.ec2.public_dns"
}
/*
output "name" {
    value = "aws_instance.ec2.aws_ami.id"
}
*/