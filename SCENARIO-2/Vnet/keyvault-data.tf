# Getting VM admin passwords from keyvault
data "azurerm_key_vault" "keyvault" {
name                = "tfdemokv123"
resource_group_name = azurerm_resource_group.test-rg.name
depends_on = [
module.keyvault,
module.access_policy_master,
]
}
data "azurerm_key_vault_secret" "password" {
name         = "password"
key_vault_id = data.azurerm_key_vault.keyvault.id
depends_on = [
module.keyvault,
module.access_policy_master,
]
}
