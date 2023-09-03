provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      TF_Product  = "tf_setup"
      Terraform   = "true"
    }
  }
}

