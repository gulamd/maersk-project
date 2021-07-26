resource "azurerm_network_security_group" "nsg-test" {
    name                = "${var.nsg-vnet-name}"
    location            = azurerm_resource_group.test-rg.location
    resource_group_name = azurerm_resource_group.test-rg.name
}
resource "azurerm_network_security_rule" "port-80" {
      name                                 = "http"
      protocol                             = "TCP"
      source_port_range                      = "*"
      destination_port_range                 = "80"
      source_address_prefix                  = "*"
      access                               = "Allow"
      priority                             = 120
      direction                            = "Inbound"
      destination_address_prefix           = "*"
      resource_group_name                  = azurerm_resource_group.test-rg.name
      network_security_group_name          = azurerm_network_security_group.nsg-test.name
    }
resource "azurerm_network_security_rule" "port-443" {
      name                                 = "https"
      protocol                             = "TCP"
      source_port_range                      = "*"
      destination_port_range                 = "443"
      source_address_prefix                  = "*"
      access                               = "Allow"
      priority                             = 130
      direction                            = "Inbound"
      destination_address_prefix           = "*"
      resource_group_name                  = azurerm_resource_group.test-rg.name
      network_security_group_name          = azurerm_network_security_group.nsg-test.name
    }
