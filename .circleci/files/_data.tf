data "aws_caller_identity" "current" {}

data "aws_ami" "canonical_ubuntu" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }


  filter {
    name   = "name"
    values = ["ubuntu/images/hvm*"]
  }
}