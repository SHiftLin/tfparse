variable "a" {
  type    = string
  default = "var_default"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "test" {
  bucket = coalesce(var.a, data.aws_caller_identity.current.account_id)
}
