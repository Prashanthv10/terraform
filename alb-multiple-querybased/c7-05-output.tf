output "ec2-public" {
    value = module.ec2-public.id
}
output "ec2-public_ip" {
    value = module.ec2-public.public_ip
}
# Private EC2 Instances
output "ec2_private_instance_ids" {
  description = "List of IDs of instances"
  value       = module.ec2-private.id
}
output "ec2-private-private_ip" {
    value = module.ec2-private.private_ip
}
output "ec2-private-app2-id" {
    value = module.ec2-private-app2.id
}
output "ec2-private-private-app2_ip" {
    value = module.ec2-private-app2.private_ip
}