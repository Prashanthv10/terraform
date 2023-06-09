data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "state-bucket-prash"
    key = "dev/project1-vpc/terraform.tfstate"
    region = "ap-southeast-2"

    }
  }

output "id1" {
  value = data.terraform_remote_state.vpc.outputs.vpc_id
}
