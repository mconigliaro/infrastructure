data "aws_ami" "ami" {
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  most_recent = true
}

resource "aws_instance" "mail" {
  ami           = "${coalesce(var.ami, data.aws_ami.ami.id)}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.mike.key_name}"
  subnet_id     = "${module.vpc.public_subnets[0]}"

  vpc_security_group_ids = [
    "${aws_security_group.mail.id}",
  ]

  tags = {
    Name = "mail"
  }

  disable_api_termination = true
}

resource "aws_ebs_volume" "data" {
  availability_zone = "us-east-1b"
  size              = 3

  tags = {
    Name = "data"
  }
}

resource "aws_volume_attachment" "mail_data" {
  device_name = "/dev/sdf"
  instance_id = "${aws_instance.mail.id}"
  volume_id   = "${aws_ebs_volume.data.id}"
}
