resource "aws_iam_role" "github_oidc_terraform_state" {
  name = "github-oidc-terraform"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::433082585283:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com",
            "token.actions.githubusercontent.com:sub" = "repo:jakoberpf/*"
          }
        }
      }
    ]
  })

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "github_oidc_terraform_state" {
  role       = aws_iam_role.github_oidc_terraform_state.name
  policy_arn = module.remote_state.terraform_iam_policy.arn
}
