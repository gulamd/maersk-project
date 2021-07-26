provider "azurerm" {
  features {}
  subscription_id = "${var.subscription-id}"
  client_id       = "${var.client-id}"
  client_secret   = "${var.client-secret}"
  tenant_id       = "${var.tenant-id}"
}

data "azurerm_resource_group" "test-rg" {
    name = "test-rg"
}

data "azurerm_subnet" "subnet1" {
    name = "subnet1"
    resource_group_name = data.azurerm_resource_group.test-rg.name
    virtual_network_name = "test-vnet"
}

resource "azurerm_public_ip" "bastion-pubip" {
    name                         = "${var.bastion-pubip-name}"
    location                     = "${var.flecqa-location}"
    resource_group_name          = data.azurerm_resource_group.test-rg.name
    allocation_method            = "Dynamic"
}

resource "azurerm_network_interface" "test-bastion-nic" {
    name                      = "${var.bastion-nic-name}"
    location                  = azurerm_public_ip.bastion-pubip.location
    resource_group_name       = data.azurerm_resource_group.test-rg.name

    ip_configuration {
        name                          = "${var.test-bastion-ip-name}"
        subnet_id                     = data.azurerm_subnet.subnet1.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.bastion-pubip.id
    }
}
resource "azurerm_linux_virtual_machine" "bastion-vm" {
    name                  = "${var.bastion-vm-name}"
    location              =  azurerm_public_ip.bastion-pubip.location
    resource_group_name   = azurerm_public_ip.bastion-pubip.resource_group_name
    network_interface_ids = [azurerm_network_interface.flecqa-bastion-nic.id]
    size                  = "Standard_B2s"

    os_disk {
        name                 = "${var.bastion-vmdisk-name}"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    os_profile {
       computer_name  = "tfdtnomod"
       admin_username = "admin"
       admin_password = data.azurerm_key_vault_secret.password.value
                }
}
