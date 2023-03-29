terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

provider "aws" {
  region = "sa-east-1"

  shared_credentials_files = ["C:/Users/Fer/.aws/credentials"]
  shared_config_files      = ["C:/Users/Fer/.aws/config"]
  profile                  = "tf"

}