resource "aws_s3_bucket" "bucket" {
  bucket = "${var.domain_name}"

  website {
    index_document = "${var.index_document}"
    error_document = "${var.error_document}"
  }
}

resource "aws_s3_bucket_object" "object" {
  count        = "${length(var.files)}"
  bucket       = "${aws_s3_bucket.bucket.bucket}"
  key          = "${element(var.files, count.index)}"
  source       = "s3_website/${aws_s3_bucket.bucket.bucket}/${element(var.files, count.index)}"
  etag         = "${filemd5("s3_website/${aws_s3_bucket.bucket.bucket}/${element(var.files, count.index)}")}"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_route53_record" "a" {
  zone_id = "${var.zone_id}"
  name    = "${var.domain_name}"
  type    = "A"

  alias {
    name                   = "${aws_s3_bucket.bucket.website_domain}"
    zone_id                = "${aws_s3_bucket.bucket.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_s3_bucket" "www_bucket" {
  bucket = "www.${var.domain_name}"

  website {
    redirect_all_requests_to = "${var.domain_name}"
  }
}

resource "aws_route53_record" "a_www" {
  zone_id = "${var.zone_id}"
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = "${aws_s3_bucket.www_bucket.website_domain}"
    zone_id                = "${aws_s3_bucket.www_bucket.hosted_zone_id}"
    evaluate_target_health = false
  }
}
