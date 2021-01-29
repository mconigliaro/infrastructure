module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.68"

  name = "default"
  cidr = "172.30.0.0/16"

  azs = [
    "us-east-1b",
    "us-east-1c",
    "us-east-1d",
    "us-east-1e",
  ]

  public_subnets = [
    "172.30.1.0/24",
    "172.30.2.0/24",
    "172.30.3.0/24",
    "172.30.4.0/24",
  ]

  enable_dns_support = true
}
