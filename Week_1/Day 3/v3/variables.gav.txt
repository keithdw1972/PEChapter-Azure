variable "resource_group_name" {
    description = "Name of Resource Group"
    type = string
    default = "WebServices"
    
}

variable "resource_group_location" {
  default =  "uk south"
}

variable "resource_subnet" {
   default     = "WebServiceSubnet"
  
}

variable "resource_network_interface" {
  resource_group_name = azurerm_resource_group.vm_group.name

}