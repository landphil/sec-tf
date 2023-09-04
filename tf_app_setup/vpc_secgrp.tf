resource "aws_security_group" "ec2_public_webserver_ingress" {
  name        = "ec2_public_webserver_ingress"
  description = "Security group for public ingress to an ec2 webserver in VPC"
  vpc_id      = module.landphil_vpc.vpc_id

  ingress {
    description      = "http ingress"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "ssh ingress"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.ssh_access_cidr
  }
}
