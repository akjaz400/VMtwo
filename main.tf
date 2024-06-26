resource "azurerm_resource_group" "rgtwo" {
  location = var.resource_group_location
  name = "${var.prefix}-rgtwo"
}
# create virtual network
resource "azurerm_virtual_network" "vnettwo" {
  
  name =  "${var.prefix}-vnettwo"
  location = var.resource_group_location
  address_space = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.rgtwo.name
}

# create subnet 
resource "azurerm_subnet" "subnettwo" {
  name = "${var.prefix}-subnettwo"
  virtual_network_name = azurerm_virtual_network.vnettwo.name
  resource_group_name = azurerm_resource_group.rgtwo.name
  address_prefixes =  ["10.0.1.0/24"]
}