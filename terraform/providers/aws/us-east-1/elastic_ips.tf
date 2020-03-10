resource "aws_eip" "mail" {
  instance = aws_instance.mail-2020-03-09.id
  vpc      = true

  tags = {
    Name = "mail"
  }
}
