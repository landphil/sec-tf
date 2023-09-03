module "dynamodb_lockid_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"
  version  = "~> 3.3" 

  name     = "landphil_sec_tf_tflockid"
  hash_key = "LockID"

  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]
}
