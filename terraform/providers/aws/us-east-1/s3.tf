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
}

resource "aws_s3_bucket_object" "conigliaro_org_index" {
  bucket       = "${module.conigliaro_org_website.bucket}"
  key          = "index.html"
  source       = "s3_website/conigliaro.org/index.html"
  etag         = "${filemd5("s3_website/conigliaro.org/index.html")}"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "conigliaro_org_robots" {
  bucket       = "${module.conigliaro_org_website.bucket}"
  key          = "robots.txt"
  source       = "s3_website/robots.txt"
  etag         = "${filemd5("s3_website/robots.txt")}"
  acl          = "public-read"
  content_type = "text/plain"
}

module "gyrate_org_website" {
  source      = "../../../modules/aws/s3_website"
  domain_name = "gyrate.org"
  zone_id     = "${aws_route53_zone.gyrate_org.id}"
}

resource "aws_s3_bucket_object" "gyrate_org_index" {
  bucket       = "${module.gyrate_org_website.bucket}"
  key          = "index.html"
  source       = "s3_website/gyrate.org/index.html"
  etag         = "${filemd5("s3_website/gyrate.org/index.html")}"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "gyrate_org_robots" {
  bucket       = "${module.gyrate_org_website.bucket}"
  key          = "robots.txt"
  source       = "s3_website/robots.txt"
  etag         = "${filemd5("s3_website/robots.txt")}"
  acl          = "public-read"
  content_type = "text/plain"
}
