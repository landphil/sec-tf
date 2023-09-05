# sec-tf
## Terraform AWS infrastructure for simple EC2 Web server in a VPC
### Setup Instructions
This repository contains two Terraform module directories
1. `aws_init_setup`: Sets up an S3 bucket and DynamoDB table to save and lock the Terraform state. **This must be set up before running any of the other Terraform modules**
2. `tf_app_setup`: Sets up AWS infrastructure for a VPC containing an EC2 instance running an Nginx Web server.

For details on running each of the modules, see the `README.md` files in the module directories.
### General Terraform and AWS Instructions
These Terraform modules were built using Terraform v1.5.6 and the AWS provider v5.0. **The modules must be run by a user or role with administrative credentials**
(we could create a specific restricted role to run the Terraform; but just being lazy by requiring admin)

Both of the Terraform modules run with AWS credentials specified external to Terraform. These include credentials defined through 
environment variables in the shell running Terraform or through credentials stored in the configuration files in the user's home directory `~/.aws/`

See https://docs.aws.amazon.com/cli/v1/userguide/cli-chap-authentication.html for details on credential setup.

To bypass the credential setup, these Terraform modules may be run from an admin user's CloudShell using these commands to set everything up (first, launch your CloudShell):

```
mkdir ~/bin
wget https://releases.hashicorp.com/terraform/1.5.6/terraform_1.5.6_linux_amd64.zip
unzip -d ~/bin terraform_1.5.6_linux_amd64.zip
git clone https://github.com/landphil/sec-tf.git  # or you could use git@github.com:landphil/sec-tf.git if you want to set up your GitHub SSH keys
```
Then change to one of the module directories and try out a couple of Terraform commands to make sure it all works:
```
$ terraform init
$ terraform validate
```
