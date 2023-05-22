output "ec2-public" {
    value = module.ec2-public.id
}
output "ec2-public_ip" {
    value = module.ec2-public.public_ip
}
output "ec2-private" {
    value = [ module.ec2-private.id[0], module.ec2-private.id[1] ]
}
output "ec2-private-private_ip" {
    value = module.ec2-private.private_ip
}