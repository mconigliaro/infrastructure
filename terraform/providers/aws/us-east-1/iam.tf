resource "aws_iam_account_password_policy" "policy" {
  minimum_password_length        = 8
  require_uppercase_characters   = true
  require_lowercase_characters   = true
  require_numbers                = true
  require_symbols                = true
  allow_users_to_change_password = true
}

resource "aws_iam_user" "mconigliaro" {
  name = "mconigliaro"
}

resource "aws_iam_group" "administrators" {
  name = "Administrators"
}

resource "aws_iam_group_policy_attachment" "administrators_administrator_access" {
  group      = aws_iam_group.administrators.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_membership" "administrators" {
  name  = "Administrators"
  group = aws_iam_group.administrators.name

  users = [
    "mconigliaro",
  ]
}

resource "aws_iam_user" "ses-smtp" {
  name = "ses-smtp-user.20160221-182330"
}

resource "aws_iam_policy" "amazon_ses_sending_access" {
  name        = "AmazonSesSendingAccess"
  description = "Allows the SES user to use SMTP"
  policy      = file("${path.module}/policies/iam/amazon_ses_sending_access.json.tpl")
}

resource "aws_iam_user_policy_attachment" "ses-smtp_amazon_ses_sending_access" {
  user       = aws_iam_user.ses-smtp.name
  policy_arn = aws_iam_policy.amazon_ses_sending_access.arn
}
