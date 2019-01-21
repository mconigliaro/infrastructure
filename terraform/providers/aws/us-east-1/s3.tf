resource "aws_s3_bucket" "mconigliaro-infrastructure" {
  bucket = "mconigliaro-infrastructure"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "conigliaro_org" {
  bucket = "conigliaro.org"

  website {
    redirect_all_requests_to = "www.conigliaro.org"
  }
}

resource "aws_s3_bucket" "www_conigliaro_org" {
  bucket = "www.conigliaro.org"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket" "gyrate_org" {
  bucket = "gyrate.org"

  website {
    redirect_all_requests_to = "www.gyrate.org"
  }
}

resource "aws_s3_bucket" "www_gyrate_org" {
  bucket = "www.gyrate.org"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}
