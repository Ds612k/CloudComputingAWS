resource "aws_s3_bucket" "my_bucket" {
  bucket = "mys3-bucket-terraform"  # Replace with a globally unique name
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
