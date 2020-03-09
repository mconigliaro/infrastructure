resource "aws_eip" "mail" {
  instance = aws_instance.mail-2017-09-12.id
  vpc      = true

  tags = {
    Name = "mail"
  }
}
