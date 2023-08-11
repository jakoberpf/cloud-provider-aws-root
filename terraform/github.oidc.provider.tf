data "aws_partition" "current" {}

resource "aws_iam_openid_connect_provider" "github" {
  url             = local.github_url
  client_id_list  = ["sts.${data.aws_partition.current.dns_suffix}"]
  thumbprint_list = distinct(concat(data.tls_certificate.github.certificates[*].sha1_fingerprint, local.github_additional_thumbprints))

  tags = local.tags
}

data "tls_certificate" "github" {
  url = local.github_url
}
