terraform {
  backend "s3" {
    bucket  = "mconigliaro-infrastructure"
    key     = "terraform/aws/us-east-1/terraform.tfstate"
    region  = "us-east-1"
    profile = "mconigliaro"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.26"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "mconigliaro"
}
