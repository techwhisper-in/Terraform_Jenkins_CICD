resource "aws_s3_bucket" "bucket1" {
	bucket = "ankit-ex-kumar-s3bucket-7-26-2024"
}

resource "aws_s3_bucket" "bucket2" {
    
}

provider "aws" {
    region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket         = "ankit-ex-kumar-s3bucket-7-26-2024"
    key            = "globalstate/s3/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "ankit-ex-kumar-7-26-2024-dblocks"
    encrypt        = true
  }
}
