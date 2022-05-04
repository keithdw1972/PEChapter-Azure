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
  name = "WebServices"
  location = "uk south"
}
resource "azurerm_virtual_network" "vm_network" {
   name                = "WebServiceNetwork"
  location            = azurerm_resource_group.vm_group.location
  resource_group_name = azurerm_resource_group.vm_group.name
  address_space       = ["10.0.0.0/22"]
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
  name                 = "WebServiceSubnet"
  resource_group_name  = azurerm_resource_group.vm_group.name
  virtual_network_name = azurerm_virtual_network.vm_network.name
  address_prefixes     = ["10.0.1.0/24"]

  #delegation {
    #name = "delegation"

    #service_delegation {
      #name    = "Microsoft.ContainerInstance/containerGroups"
      #actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    #}
  #}

}
resource "azurerm_network_interface" "network_interface" {
  name                = "WebServices-NI"
  location            = azurerm_resource_group.vm_group.location
  resource_group_name = azurerm_resource_group.vm_group.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "virtual_machine" {
  name                = "virtual-machine"
  resource_group_name = azurerm_resource_group.vm_group.name
  location            = azurerm_resource_group.vm_group.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  license_type = "Windows_Server"
  network_interface_ids = [
    azurerm_network_interface.network_interface.id
  ]

  os_disk {
    caching              = "ReadOnly"
    storage_account_type = "Standard_LRS"
    disk_size_gb = "32"
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
    environment = "production"
  }

}