resource "aws_iam_user" "terraform" {
  name = "Terraform"

  tags = {
    Terraform = "true"
  }
}

resource "aws_iam_user_policy_attachment" "remote_state_access" {
  user       = aws_iam_user.terraform.name
  policy_arn = module.remote_state.terraform_iam_policy.arn
}

resource "aws_iam_access_key" "terraform" {
  user = aws_iam_user.terraform.name
}

/* output "terraform_access_key" {
  value = aws_iam_access_key.terraform.id
}

output "terraform_secret_key" {
  value     = aws_iam_access_key.terraform.secret
  sensitive = true
} */
