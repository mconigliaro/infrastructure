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
