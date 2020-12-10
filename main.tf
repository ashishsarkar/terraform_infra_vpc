# Provider - AWS 
provider "aws" {
  region = var.aws_region
}

# Backend - S3
terraform {
  required_version = "~> 0.12"
  backend "s3" {
    encrypt = true
  }
}

# Module to provision VPC
module "s3" {
  source = "./s3"

  bucket_name      = var.bucket_name
  # policy_json      = var.policy_json
  aws_region       = var.aws_region
  deployment_stage = var.deployment_stage
}