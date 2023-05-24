terraform {
  // required_version = "~>0.14.3"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3"
    }
    null = {  
      source = "hashicorp/null"
      version = "~> 2.70.0"
} 

  }
}
provider "aws" {
  region = var.aws_region
}

