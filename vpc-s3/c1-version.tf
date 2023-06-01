terraform {
  // required_version = "~>0.14.3"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3"
    }
    null = {  
      source = "hashicorp/null"
      version = "~> 3.0.0"
} 

  }
  backend "s3" {
    bucket = "state-bucket-prash"
    key    = "dev/project1-vpc/terraform.tfstate"
    region = "ap-southeast-2"

    dynamodb_table = "dev-project-vpc"
  }
}
provider "aws" {
  region = var.aws_region
}

