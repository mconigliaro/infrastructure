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
  instance_id = aws_instance.mail.id
  volume_id   = aws_ebs_volume.data.id
}

resource "aws_instance" "mail" {
  # https://cloud-images.ubuntu.com/locator/ec2/
  # us-east-1 focal amd64
  ami           = "ami-042e8287309f5df03"
  instance_type = "t3a.micro"
  key_name      = aws_key_pair.mike.key_name
  subnet_id     = module.vpc.public_subnets[0]

  credit_specification {
    cpu_credits = "standard"
  }

  vpc_security_group_ids = [
    module.vpc.default_security_group_id,
    aws_security_group.mail.id,
  ]

  tags = {
    Name = "mail"
  }
}
