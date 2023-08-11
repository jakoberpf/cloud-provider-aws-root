resource "aws_iam_role" "github_oidc_administrator" {
  name = "github-oidc-administrator"

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
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:jakoberpf/cloud-provider-aws-root:*"
          }
        }
      }
    ]
  })

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "github_oidc_administrator" {
  role       = aws_iam_role.github_oidc_administrator.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
