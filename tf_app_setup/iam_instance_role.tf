resource "aws_iam_instance_profile" "ssm_access" {
  name = "ec2-ssm-access-profile"
  role = aws_iam_role.instance_role.name
}

resource "aws_iam_role" "instance_role" {
  name = "ec2-ssm-access-instance-role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "instance_ssm_access" {
  role       = aws_iam_role.instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

