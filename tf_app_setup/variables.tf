variable "aws_region" {
  description = "Region to deploy infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "ssh_access_cidr" {
  description = "Region to deploy infrastructure"
  type        = list
  default     = ["76.209.242.132/32"]
}
