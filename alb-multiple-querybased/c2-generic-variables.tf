variable "aws_region" {
  description = "region name"
  type = string
  default = "us-east-2"
}

variable "environment" {
  description = "value"
  type = string
  default = "dev"
}
variable "business_division" {
  description = "business division"
  type = string
default = "HR" 
}