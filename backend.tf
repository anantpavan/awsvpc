terraform {
  backend "s3" {
    bucket  = "tfstatebucket12"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true
  }
}