terraform {
  backend "s3" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> v5.3.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

provider "aws" {
  alias  = "replica"
  region = "us-east-1"
}
