terraform {
  backend "s3" {
    bucket         = "terraform-shriya-s3-backend-demo-bucket"
    key            = "path/to/my/key"
    region         = "us-west-2"
    dynamodb_table = "terraform-shriya-s3-backend-demo-table"
  }
}
