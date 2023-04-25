# output "instance_publicip" {
#     description = "ec2publicip"
#     value = "aws_instance.ec2.public_ip"
# }
# output "instance_publicdns" {
#     description = "ec2dns"
#     value = "aws_instance.ec2.public_dns"
# }
# # /*
# output "name" {
#     value = "aws_instance.ec2.aws_ami.id"
# }
# */

# Output - For Loop with List
output "for_output_list" {
  description = "For Loop with List"
  value = [for instance in aws_instance.ec2: instance.public_dns ]
}
# Output - For Loop with Map
output "For_output_map" {
    value = {for instance in aws_instance.ec2: instance.id => instance.public_dns}
}

# Output - For Loop with Map Advanced
output "for_output_map2" {
  description = "For Loop with Map - Advanced"
  value = {for c, instance in aws_instance.ec2: c => instance.public_dns}
}

# Output Legacy Splat Operator (latest) - Returns the List
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Expression"
  value = aws_instance.ec2.*.public_dns
}  

# Output Latest Generalized Splat Operator - Returns the List
output "latest_splat_instance_publicdns" {
  description = "Generalized Splat Expression"
  value = aws_instance.ec2[*].public_dns
}


output "for_loop_count" {
    value = asw_instance.ec2[*].public_dns
}
















