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
    "${module.vpc.default_security_group_id}",
    "${aws_security_group.mail.id}",
  ]

  tags = {
    Name = "mail"
  }

  disable_api_termination = true
}
