# variable "instance_type" {
#   type = string
#   description = "type"
#   default = "t2.micro"
# }

variable "aws_region" {
  type = string
  description = "region"
  default = "ap-southeast-2"
}

# variable "instance_list" {
#   description = "instance_list"
#   type = list(string)
#   default = [ "t2.micro","t3.micro" ] #if variable is list put avalues inside [] brackets
# }

# variable "instance_map" {
#   description = "instance_map"
#   type = map(string) #if the variables are map put inside {}
#   default = {
#     "dev" = "t2.micro"
#     "prod" = "t3.micro"
#     "qa" = "t2.large"
#   }
#}