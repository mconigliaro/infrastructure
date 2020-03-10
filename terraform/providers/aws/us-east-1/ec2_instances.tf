resource "aws_ebs_volume" "data" {
  availability_zone = "us-east-1b"
  type              = "standard"
  size              = 3

  tags = {
    Name = "data"
  }
}

resource "aws_volume_attachment" "mail_data" {
  device_name = "/dev/sdf"
  instance_id = aws_instance.mail-2020-03-09.id
  volume_id   = aws_ebs_volume.data.id
}

resource "aws_instance" "mail-2020-03-09" {
  ami           = "ami-046842448f9e74e7d" # us-east-1 bionic hvm ssd
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mike.key_name
  subnet_id     = module.vpc.public_subnets[0]

  vpc_security_group_ids = [
    module.vpc.default_security_group_id,
    aws_security_group.mail.id,
  ]

  tags = {
    Name = "mail-2020-03-09"
  }

  volume_tags = {
    Name = "mail-2020-03-09"
  }

  disable_api_termination = true
}
