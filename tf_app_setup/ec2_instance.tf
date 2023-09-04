module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.5"

  name = "webserver-instance"

  ami                         = data.aws_ami.latest_amz_linux.id
  instance_type               = "t2.micro"
  iam_instance_profile        = aws_iam_instance_profile.ssm_access.name
  key_name                    = "phil-ec2-nva"
  monitoring                  = false
  vpc_security_group_ids      = [aws_security_group.ec2_public_webserver_ingress.id]
  associate_public_ip_address = true
  subnet_id                   = random_shuffle.vpc_subnet.result[0]
  user_data_replace_on_change = true

  user_data = <<EOF
#!/bin/bash
echo "Enable and install nginx server"
amazon-linux-extras enable nginx1
yum clean metadata
yum install nginx -y
systemctl enable nginx
systemctl daemon-reload
echo '<!DOCTYPE html> <html> <head> <title>Hello, Terraform!</title> </head> <body> <h1>Hello, Terraform!</h1> </body> </html>' > /usr/share/nginx/html/index.html
chmod 0644 /usr/share/nginx/html/index.html
systemctl start nginx


EOF

}

resource "random_shuffle" "vpc_subnet" {
  input = module.landphil_vpc.public_subnets
  result_count = 1
}

data "aws_ami" "latest_amz_linux" {
   most_recent = true
   owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

