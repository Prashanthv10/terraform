# # EC2 Instance Public IP with TOSET
# output "instance_publicip" {
#   description = "EC2 Instance Public IP"
#   #value = aws_instance.ec2.*.public_ip   # Legacy Splat # here it will not work because .*. is for count and listnot for for_each so use for loop
#   #value = aws_instance.ec2[*].public_ip  # Latest Splat
#   value = toset([for ec2 in aws_instance.ec2 : ec2.public_ip])  
# }

# # EC2 Instance Public DNS with TOSET
# output "instance_publicdns" {
#   description = "EC2 Instance Public DNS"
#   #value = aws_instance.ec2[*].public_dns  # Legacy Splat
#   #value = aws_instance.ec2[*].public_dns  # Latest Splat
#   value = toset([
#       for ec2 in aws_instance.ec2 : ec2.public_dns
#     ])    

# }# EC2 Instance Public DNS with MAPS
# output "instance_publicdns2" {
#   value = tomap({for az, ec2 in aws_instance.ec2: az => ec2.public_dns})
#     # az intends to be a  availability zone 
# }

output "azname" {
  value = "data.aws_availability_zones.example.names"
}