variable "instance_type" {
  description = "instance type"
  type = string
  default = "t2.micro"
}
variable "instance_keypair" {
  description = "keypair"
  type = string
  default = "terraform-key"
}
variable "private_instance_count" {
  description = "count"
  type = number
  default = 2
}