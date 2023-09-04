module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.5"

  name = "webserver-instance"

  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = false
  vpc_security_group_ids = [aws_security_group.ec2_public_webserver_ingress.id]
  subnet_id              = "random_shuffle.vpc_subnet"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "random_shuffle" "vpc_subnet" {
  input = module.landphil_vpc.public_subnets
  result_count = 1
}
