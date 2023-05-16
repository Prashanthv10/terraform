output "public_security_group_id" {
    value = module.public-bastion-sg.this_security_group_id
}
output "private_sg_grp_id" {
    value = module.private-sg.this_security_group_id
}
output "public_sg_grp_name" {
    value = module.public-bastion-sg.this_security.group.name
}
output "private_sg_grp_name" {
    value = module.private-sg.this_security.group.name
}