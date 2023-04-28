output "instance_publicip" {
    description = "ec2publicip"
    value = "aws_instance.ec2.public_ip"
}
output "instance_publicdns" {
    description = "ec2dns"
    value = "aws_instance.ec2.public_dns"
}
/*
output "name" {
    value = "aws_instance.ec2.aws_ami.id"
}
*/