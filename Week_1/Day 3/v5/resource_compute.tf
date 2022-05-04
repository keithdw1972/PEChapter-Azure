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
  admin_password      = random_password.vm_password.result
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