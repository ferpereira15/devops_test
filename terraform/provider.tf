terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

provider "aws" {
  region = var.region
  shared_credentials_files = ["C:/Users/SEU_USUÁRIO/.aws/credentials"]
  shared_config_files      = ["C:/Users/SEU_USUÁRIO/.aws/config"]
  profile                  = "terraform"
}