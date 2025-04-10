resource "aws_s3_bucket" "static_files" {
  bucket = "myhw-static-web-files"  # Replace with a globally unique name

  tags = {
    Name = "Static Web Files Bucket"
  }
}

resource "aws_s3_bucket_website_configuration" "static_site" {
  bucket = aws_s3_bucket.static_files.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "static_bucket_policy" {
  bucket = aws_s3_bucket.static_files.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "PublicReadGetObject"
        Effect = "Allow"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.static_files.arn}/*"
        Principal = "*"
      }
    ]
  })
}


resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket = aws_s3_bucket.static_files.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

