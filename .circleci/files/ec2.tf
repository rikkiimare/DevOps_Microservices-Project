resource "aws_security_group" "configure_access" {
  name        = "configure-access"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]

      description     = ""
      from_port       = 22
      prefix_list_ids = []
      protocol        = "tcp"
      security_groups = []
      self            = false
      to_port         = 22
    },
    {
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]

      description     = ""
      from_port       = 80
      prefix_list_ids = []
      protocol        = "tcp"
      security_groups = []
      self            = false
      to_port         = 80
    },{
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]

      description     = ""
      from_port       = 8000
      prefix_list_ids = []
      protocol        = "tcp"
      security_groups = []
      self            = false
      to_port         = 8000
    },
  ]

  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]

      description     = ""
      from_port       = 80
      to_port         = 80
      prefix_list_ids = []
      protocol        = "tcp"
      security_groups = []
      self            = false
    },
    {
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]

      description     = ""
      from_port       = 443
      to_port         = 443
      prefix_list_ids = []
      protocol        = "tcp"
      security_groups = []
      self            = false
    },
  ]

  tags = {
    Name = "ssh_access"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "curl-instance"

  #ami                    = data.aws_ami.canonical_ubuntu.id
  ami                    = "ami-0557a15b87f6559cf"
  key_name               = "ric-key-pair"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.configure_access.id]
  subnet_id              = module.vpc.public_subnet_ids[0]
}