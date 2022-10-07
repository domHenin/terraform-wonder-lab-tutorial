# provider "aws" {
#   shared_credentials_file = pathexpand(var.provider_default_aws_shared_credentials_file)
#   profile                 = var.provider_default_aws_profile
#   region                  = var.provider_default_aws_region
#   allowed_account_ids     = var.provider_default_aws_account_id
#   version                 = "~> 2.0"
# }