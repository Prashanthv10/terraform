# output "ec2-public" {
#     value = module.ec2-public.id
# }
# output "ec2-public_ip" {
#     value = module.ec2-public.public_ip
# }
output "vpc_id" {
  value = data.terraform_remote_state.vpc.outputs.vpc_id
}

