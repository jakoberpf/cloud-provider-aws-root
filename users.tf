resource "aws_iam_user" "lb" {
  name = "test"
  path = "/test/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.lb.name
}

output "access_key" {
  value = aws_iam_access_key.lb.id
}

output "secret_key" {
  value     = aws_iam_access_key.lb.secret
  sensitive = true
}
