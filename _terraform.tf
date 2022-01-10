terraform {
  required_providers {
    aws = {
      version = "= 3.50.0"
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}
