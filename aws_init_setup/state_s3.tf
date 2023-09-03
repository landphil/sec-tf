module "s3_tfstate_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.15"

  bucket  = "landphil-sec-tf-tfstate"
  acl     = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

