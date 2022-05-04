resource "azurerm_virtual_network" "vm_network" {
  name                = var.network_name
  location            = azurerm_resource_group.vm_group.location
  resource_group_name = azurerm_resource_group.vm_group.name
  address_space       = [var.network_address]
  #dns_servers         = ["10.0.0.4", "10.0.0.5"]

  #subnet {
    #name           = "subnet1"
    #address_prefix = "10.0.1.0/24"
  #}

  #subnet {
   # name           = "subnet2"
    #address_prefix = "10.0.2.0/24"
    #security_group = azurerm_network_security_group.example.id
  #}

  tags = {
    environment = "Production"
  }

}
resource "azurerm_subnet" "vm_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.vm_group.name
  virtual_network_name = azurerm_virtual_network.vm_network.name
  address_prefixes     = [var.subnet_address]

  #delegation {
    #name = "delegation"

    #service_delegation {
      #name    = "Microsoft.ContainerInstance/containerGroups"
      #actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    #}
  #}

}