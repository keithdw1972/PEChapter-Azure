terraform {
    required_providers {
      azurerm = {
        source =  "hashicorp/azurerm"
        version = ">=2.29.0"
      }
 }
  required_version = "~>1.1.6"
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "vm_group" {
  name = var.resource_group_name
  location = var.resource_location
}
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
resource "azurerm_network_interface" "network_interface" {
  name                = var.vm_network_interface
  location            = azurerm_resource_group.vm_group.location
  resource_group_name = azurerm_resource_group.vm_group.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "virtual_machine" {
  name                = var.resource_name
  resource_group_name = azurerm_resource_group.vm_group.name
  location            = azurerm_resource_group.vm_group.location
  size                = var.resource_size
  admin_username      = var.admin_username
  admin_password      = var.admin_username
  license_type = "Windows_Server"
  network_interface_ids = [
    azurerm_network_interface.network_interface.id
  ]

  os_disk {
    caching               = "ReadOnly"
    storage_account_type  = var.vm_disk_type
    disk_size_gb          = var.vm_disk_size
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter-Smalldisk"
    version   = "latest"
    
  }
  boot_diagnostics {
    storage_account_uri = null
    
  }
  tags = {
    environment = var.vm_environment
  }

}