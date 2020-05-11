terraform {
  backend "s3" {
    bucket  = "my_bucket_name"
    region  = "my region"
    key     = "terraform/test1"
    profile = "aws_profile_name"
  }
}