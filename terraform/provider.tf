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

  shared_credentials_files = var.shared_credentials_files
  shared_config_files      = var.shared_config_files
  profile                  = var.profile

}