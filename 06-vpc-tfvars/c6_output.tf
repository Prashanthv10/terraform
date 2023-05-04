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
  value = toset(data.aws_availability_zones.example.names)
}

output "cidr" {
  value = "resource.aws_subnet.public.cidr_block"
}

# VPC Output Values

# VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# VPC CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

# VPC Private Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

# VPC Public Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

# VPC NAT gateway Public IP
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

# VPC AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc.azs
}