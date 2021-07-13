terraform {

  backend "s3" {
   bucket = "zolinz-terraform-state-backend"
    region = "ap-southeast-2"
    dynamodb_table = "terraform_state"
    key    = "dev/mystate"
  }
}
