terraform {
  backend "s3" {
    bucket = "udacity-tf-richard-student1" # Update here with your S3 bucket
    key    = "terraform/ml-microservices.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = local.tags
  }
}