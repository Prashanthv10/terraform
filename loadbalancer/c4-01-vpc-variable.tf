variable "vpc_cidr_block" {
  description = "cidr block"
  type = string
  default = "10.0.0.0/16"
}
variable "vpc-name" {
    description = "vpc name"
    type = string
    default = "myvpc"
  
}
variable "vpc_availability_zones" {
  description = "az name"
  type = list(string)
  default = [ "us-east-2a", "us-east-2b" ]
}
variable "vpc_public_subnets" {
  description = "subnets name"
  type = list(string)
  default = [ "10.0.101.0/24", "10.0.102.0/24" ]
}
variable "vpc_private_subnets" {
  description = "private"
  type = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}
variable "vpc_database_subnets" {
    description = "db name"
    type = list(string)
    default = [ "10.0.151.0/24", "10.0.152.0/24" ]
}
variable "enable_nat_gateway" {
  description = "enable gateway"
  type = bool
  default = true
}
variable "single_nat_gateway" {
  description = "single"
  type = bool
  default = true
}
variable "vpc_create_database_subnet_group" {
  description = "create"
  type = bool
  default = true
}
variable "vpc_create_database_subnet_route_table" {
  description = "route table"
  type = bool
  default = true
}