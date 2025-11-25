variable "cosmosdb_account_name" {
  type        = string
  default     = null
  description = "Cosmos db account name"
}

locals {
  cosmosdb_account_name = "abc"
  test_second           = "def"
}

resource "azure-res-test1" "example1" {
  name     = local.cosmosdb_account_name
  location = "eastus"
}

resource "azure-res-test2" "example2" {
  name     = azure-res-test1.example1.name + "-suffix"
  location = "eastus"
}
