# # Availability Zones Datasource to create the ec2 in each az so using Datasource 
# # it will give the az name that az name will be used to create ec2 and its tags
# data "aws_availability_zones" "my_azones" {
#   filter {
#     name   = "opt-in-status"
#     values = ["opt-in-not-required"]
#   }
# }
# resource "aws_instance" "ec2" {
#  # ami           = data.aws_ami.amznlnx.image_id
#   ami           = "ami-05f998315cca9bfe3"
#   #instance_type = var.instance_type # string variable
#   #instance_type = var.instance_list[0] #0 or 1  for list
#   instance_type = var.instance_map["dev"] #key value
#   vpc_security_group_ids = [ aws_security_group.vpc-web.id, aws_security_group.vpc-ssh.id ]
#   #availability_zone = "value"   #for single az
#   for_each = toset(data.aws_availability_zones.my_azones.names) # input values for multiple avalability zones
#   availability_zone = "each.key" # for multiple avalability zones
#   #count = "2"
#   tags = {
#     "Name" = "ec2-${each.key}"
#   }

#   # tags = {
#   #   "Name" = "ec2p"  #for single
#   # }
# }
