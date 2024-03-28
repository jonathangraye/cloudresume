terraform {
  required_providers {
    aws = {
        version = ">4.9.0"
        source = "hasicorp/aws"
    }
  }  
  }
provider "aws" {
    profile = ""
    access_key = ""
    secret_key = "" 
    region = ""
}