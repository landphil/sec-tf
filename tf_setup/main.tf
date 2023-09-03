provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      TF_Product  = "infra_setup"
      Terraform   = "true"
    }
  }
}

