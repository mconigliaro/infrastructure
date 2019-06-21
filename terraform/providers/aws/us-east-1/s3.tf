resource "aws_s3_bucket" "mconigliaro-infrastructure" {
  bucket = "mconigliaro-infrastructure"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "conigliaro_org" {
  bucket = "conigliaro.org"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "conigliaro_org_index" {
  bucket       = "${aws_s3_bucket.conigliaro_org.bucket}"
  key          = "index.html"
  source       = "s3/conigliaro.org/index.html"
  etag         = "${filemd5("s3/conigliaro.org/index.html")}"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "conigliaro_org_robots" {
  bucket       = "${aws_s3_bucket.conigliaro_org.bucket}"
  key          = "robots.txt"
  source       = "s3/robots.txt"
  etag         = "${filemd5("s3/robots.txt")}"
  acl          = "public-read"
  content_type = "text/plain"
}

resource "aws_s3_bucket" "www_conigliaro_org" {
  bucket = "www.conigliaro.org"

  website {
    redirect_all_requests_to = "conigliaro.org"
  }
}

resource "aws_s3_bucket" "gyrate_org" {
  bucket = "gyrate.org"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "gyrate_org_index" {
  bucket       = "${aws_s3_bucket.gyrate_org.bucket}"
  key          = "index.html"
  source       = "s3/gyrate.org/index.html"
  etag         = "${filemd5("s3/gyrate.org/index.html")}"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "gyrate_org_robots" {
  bucket       = "${aws_s3_bucket.gyrate_org.bucket}"
  key          = "robots.txt"
  source       = "s3/robots.txt"
  etag         = "${filemd5("s3/robots.txt")}"
  acl          = "public-read"
  content_type = "text/plain"
}

resource "aws_s3_bucket" "www_gyrate_org" {
  bucket = "www.gyrate.org"

  website {
    redirect_all_requests_to = "gyrate.org"
  }
}
