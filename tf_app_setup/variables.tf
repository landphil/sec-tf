variable "aws_region" {
  description = "Region to deploy infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "ssh_access_cidr" {
  description = "Allowed source IP addresses for SSH access to the webserver instance"
  type        = list
  default     = ["76.209.242.132/32"]
}

variable "key_name" {
  description = "EC2 Keypair for SSH access to the instance"
  type        = string
  default     = "phil-ec2-nva"
}
