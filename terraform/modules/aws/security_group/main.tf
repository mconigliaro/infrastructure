resource "aws_security_group" "security_group" {
  name_prefix = "${var.name}-"
  description = "${var.description}"
  vpc_id      = "${var.vpc_id}"

  # Replace the default egress rule that is normally removed by Terraform
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
