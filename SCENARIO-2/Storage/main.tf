data "azurerm_resource_group" "test-rg" {
    name = "test-rg"
}

resource "azurerm_storage_account" "storage" {
  name                     = "${var.storage-account-name}"
  resource_group_name      = data.azurerm_resource_group.flec-rg.name
  location                 = "${var.stg-location}"
  account_tier             = "${var.account-tier}"
  account_replication_type = "${var.account-replication-type}"
  account_kind = "${var.account-kind}"
  enable_https_traffic_only = true
