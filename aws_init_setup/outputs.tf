output "aws_s3_state_bucket" {
  value = module.s3_tfstate_bucket.s3_bucket_id
}

output "aws_dynamodb_lock_table" {
  value = module.dynamodb_lockid_table.dynamodb_table_id
}


