resource "aws_s3_bucket" "mconigliaro-infrastructure" {
  bucket = "mconigliaro-infrastructure"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "terraform"
    enabled = true

    prefix = "terraform/"

    noncurrent_version_expiration {
      days = 30
    }

    expiration {
      expired_object_delete_marker = true
    }

    abort_incomplete_multipart_upload_days = 7
  }
}

module "conigliaro_org_website" {
  source      = "../../../modules/aws/s3_website"
  domain_name = "conigliaro.org"
  zone_id     = "${aws_route53_zone.conigliaro_org.id}"

  files = [
    "index.html",
    "robots.txt",
  ]
}

module "gyrate_org_website" {
  source      = "../../../modules/aws/s3_website"
  domain_name = "gyrate.org"
  zone_id     = "${aws_route53_zone.gyrate_org.id}"

  files = [
    "index.html",
    "robots.txt",
  ]
}
