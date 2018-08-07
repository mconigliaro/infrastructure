terraform {
  backend "s3" {
    bucket = "mconigliaro-infrastructure"
    key = "terraform/aws/us-east-1/terraform.tfstate"
    region = "us-east-1"
    profile = "mconigliaro"
  }
}

provider "aws" {
  version = "~> 1.30"
  region = "us-east-1"
  profile = "mconigliaro"
}

provider "template" {
  version = "~> 1.0"
}
