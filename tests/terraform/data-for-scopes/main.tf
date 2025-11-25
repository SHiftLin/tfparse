data "azurerm_client_config" "current" {}

resource "azurerm_cosmosdb_sql_role_definition" "example" {
  name                = "examplesqlroledef"
  resource_group_name = "rg1"
  account_name        = "cosmosdbaccount1"
  type                = "CustomRole"
  assignable_scopes   = [
    "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/"
  ]

  permissions {
    data_actions = ["Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/read"]
  }
}