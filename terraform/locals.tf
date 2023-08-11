locals {
  tags = {
    Terraform = true
    Project   = "jakoberpf/cloud-provider-aws-root"
  }
  github_url = "https://token.actions.githubusercontent.com"
  github_additional_thumbprints = [
    "6938fd4d98bab03faadb97b34396831e3780aea1",
    "1c58a3a8518e8759bf075b76b750d4f2df264fcd"
  ]
}
