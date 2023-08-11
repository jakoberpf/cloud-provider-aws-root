module "remote_state" {
  source  = "nozaq/remote-state-s3-backend/aws"
  version = "1.5.0"

  providers = {
    aws         = aws
    aws.replica = aws.replica
  }

  s3_bucket_name          = "hashicorp-terraform-backend"
  s3_bucket_name_replica  = "hashicorp-terraform-backend-replica"
  override_s3_bucket_name = true

  tags = local.tags
}

/* output "terraform_state_bucket" {
  value = module.remote_state.state_bucket.bucket
}

output "terraform_dynamodb_table" {
  value = module.remote_state.dynamodb_table.id
}

output "terraform_kms_key" {
  value = module.remote_state.kms_key.id
} */
