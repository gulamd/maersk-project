provider "azurerm" {
  features {}
  subscription_id = "${var.subscription-id}"
  client_id       = "${var.client-id}"
  client_secret   = "${var.client-secret}"
  tenant_id       = "${var.tenant-id}"
}

resource "azurerm_resource_group" "test-rg" {
  name     = "${var.vnet-rg}"
  location = "${var.vnet-location}"
}

resource "azurerm_virtual_network" "vnet-name" {
  name                = "${var.vnet-name}"
  location            = azurerm_resource_group.vnet-rg.location
  resource_group_name = azurerm_resource_group.vnet-rg.name
  address_space       = "${var.vnet-address-space}"
}
resource "azurerm_subnet" "subnet1" {
  name                 = "${var.subnet1-name}"
  resource_group_name  = azurerm_resource_group.test-rg.name
  virtual_network_name = azurerm_virtual_network.test-name.name
  address_prefixes     = "${var.subnet1-address-space}"
}
resource "azurerm_subnet" "subnet2" {
  name                 = "${var.subnet2-name}"
  resource_group_name  = azurerm_resource_group.test-rg.name
  virtual_network_name = azurerm_virtual_network.test-name.name
  address_prefixes     = "${var.subnet2-address-space}"
}
