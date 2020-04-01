resource "aws_eip" "mail" {
  instance = aws_instance.mail.id
  vpc      = true

  tags = {
    Name = "mail"
  }
}
