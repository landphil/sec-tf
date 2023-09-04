provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      TF_Product  = "aws_init_setup"
      Terraform   = "true"
    }
  }
}

