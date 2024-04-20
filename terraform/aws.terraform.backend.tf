module "remote_state" {
  source  = "nozaq/remote-state-s3-backend/aws"
  version = "1.6.1"

  providers = {
    aws         = aws
    aws.replica = aws.replica
  }

  s3_bucket_name          = "hashicorp-terraform-backend"
  s3_bucket_name_replica  = "hashicorp-terraform-backend-replica"
  override_s3_bucket_name = true

  tags = local.tags
}
