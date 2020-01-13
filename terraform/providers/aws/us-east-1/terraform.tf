terraform {
  backend "s3" {
    bucket  = "mconigliaro-infrastructure"
    key     = "terraform/aws/us-east-1/terraform.tfstate"
    region  = "us-east-1"
    profile = "mconigliaro"
  }
}

provider "aws" {
  version = "~> 2.44"
  region  = "us-east-1"
  profile = "mconigliaro"
}
