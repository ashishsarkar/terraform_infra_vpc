data "aws_availability_zones" "available" {}


# Create S3 Bucket
resource "aws_s3_bucket" "medly_web_static" {
  bucket = "${var.bucket_name}"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name        = "${var.bucket_name}"
    Environment = "${var.deployment_stage}"
  }
}


resource "aws_s3_bucket_policy" "medly_web_static_policy" {
  bucket = aws_s3_bucket.medly_web_static.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::web-s3-cf-dynamodb-dev/*"
        }
    ]
}
POLICY
}
