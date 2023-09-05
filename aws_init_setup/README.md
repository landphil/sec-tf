# aws_init_setup
## Terraform module to set up an S3 bucket and DynamoDB table to save and lock the Terraform state
### Setup Instructions
**See the `README.md` in the root directory for general Terraform and AWS setup**

**NOTE** This module must be run before any other Terraform modules to set up the S3 state storage and DynamoDB locking

The S3 bucket for state storage is currently set to `landphil-sec-tf-tfstate` in the `aws_init_setup/state_s3.tf` file. This is purposely not a 
variable; since it is not allowed to be a variable in the provider setup block in `tf_app_setup/main.tf`. Since this bucket is
already provisioned, if someone outside of my account tries to run either module, they will fail. For everything to work, you will need
to specify a new bucket name in both `aws_init_setup/state_s3.tf` and `tf_app_setup/main.tf`

### Deploy and Management Instructions
The deployment and management for this module follows the standard Terraform procedure:
```
terraform init
terraform validate
terraform plan
terraform apply
```
and to destroy the infrastructure
```
terraform destroy
