terraform {

  required_version = ">=1.1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}

provider "aws" {
  profile = "default"

  default_tags {

    tags = {
      managed-by = "terraform"
    }

  }
}