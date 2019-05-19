resource "aws_security_group" "mail" {
  name_prefix = "mail-"
  description = "Mail server"
  vpc_id      = "${module.vpc.vpc_id}"

  # Replace the default egress rule that is normally removed by Terraform
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mail"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "http" {
  security_group_id = "${aws_security_group.mail.id}"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Certbot"
}

resource "aws_security_group_rule" "icmp_echo_request" {
  security_group_id = "${aws_security_group.mail.id}"
  type              = "ingress"
  from_port         = 8
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "ICMP echo request"
}

resource "aws_security_group_rule" "imap" {
  security_group_id = "${aws_security_group.mail.id}"
  type              = "ingress"
  from_port         = 143
  to_port           = 143
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "IMAP"
}

resource "aws_security_group_rule" "smtp" {
  security_group_id = "${aws_security_group.mail.id}"
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "SMTP"
}

resource "aws_security_group_rule" "ssh" {
  security_group_id = "${aws_security_group.mail.id}"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "SSH"
}

resource "aws_security_group_rule" "submission" {
  security_group_id = "${aws_security_group.mail.id}"
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Submission"
}
