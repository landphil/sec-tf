terraform {
  backend "s3" {
    bucket         = "landphil-sec-tf-tfstate"
    key            = "infra_setup/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = false
    dynamodb_table = "landphil_sec_tf_tflockid"
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      TF_Product  = "tf_app_setup"
      Terraform   = "true"
    }
  }
}

