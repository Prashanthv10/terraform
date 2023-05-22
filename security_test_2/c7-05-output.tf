output "ec2-public" {
    value = module.ec2-public.id
}
output "ec2-public_ip" {
    value = module.ec2-public.public_ip
}
output "ec2_bastion_public_instance_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_public.id
}
output "ec2-private-private_ip" {
    value = module.ec2-private.private_ip
}