
variable "table_name" {
  description = "Dynamodb table name (space is not allowed)"
  default = "terraform_counter"
}

variable "table_billing_mode" {
  description = "Controls how you are charged for read and write throughput and how you manage capacity."
  default = "PAY_PER_REQUEST"
}

variable "region" {
    description = "AWS region"
  default = "eu-west-2"
}