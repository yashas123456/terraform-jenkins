# refer to a resource group
data "azurerm_resource_group" "test" {
  name = var.resource_group_name
}

#refer to a subnet
data "azurerm_subnet" "test" {
  name                 = var.network_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_network_security_group" "test" {
  name = var.network_security_group
  #location = "${data.azurerm_resource_group.test.location}"
  resource_group_name = var.resource_group_name  
}

output "location" {
  value = data.azurerm_network_security_group.test.location
}
# Locate the existing custom/golden image
data "azurerm_image" "search" {
  name                = "whatsapp-bsp-image-20211117"
  resource_group_name = var.resource_group_name 
}

#output "image_id" {
  #value = "/subscriptions/4f5c9f2a-3584-4bbd-a26e-bbf69ffbfbe6/resourceGroups/RG-EASTUS-SPT-PLATFORM/providers/Microsoft.Compute/images/AZLXSPTDEVOPS01_Image"
#}
# create a network interface
resource "azurerm_network_interface" "test" {
  name                = var.network_interface_name
  #name                = "${var.network_interface_name}-nic-${count.index}"
  location            = "${data.azurerm_resource_group.test.location}"
  resource_group_name = "${data.azurerm_resource_group.test.name}"
  enable_accelerated_networking = true
 
  ip_configuration {
    name                          = "testconfiguration"
    #name                          = "testconfiguration${count.index}"
    subnet_id                     = "${data.azurerm_subnet.test.id}"
    private_ip_address_allocation = "dynamic"
  }
}
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.test.id
  network_security_group_id = data.azurerm_network_security_group.test.id
}

# Create virtual machine
resource "azurerm_virtual_machine" "test" {
    #count = length(var.vm_name)
    #name = "${var.vm_name[count.index]}"
    name                  = "${vm_name}" 
    location              = "${azurerm_network_interface.test.location}"
    resource_group_name   = "${data.azurerm_resource_group.test.name}"
    network_interface_ids = ["${azurerm_network_interface.test.id}"]
    vm_size               = var.vm_size
    
    #name        nt           = "${var.vm_name}-${count.index}"
    
# Uncomment this line to delete the OS disk automatically when deleting the VM
delete_os_disk_on_termination = true

# Uncomment this line to delete the data disks automatically when deleting the VM
delete_data_disks_on_termination = true

  #storage_image_reference {
    #publisher = "Canonical"
    #offer     = "ubuntu-server"
    #sku       = "20.04-LTS"
    #version   = "latest"
  #}
   #storage_os_disk {
    #name              = "myosdisk1"
    #caching           = "ReadWrite"
    #create_option     = "FromImage"
    #managed_disk_type = "Standard_LRS"
  #}
   storage_image_reference {
    id = "${data.azurerm_image.search.id}"
}

   storage_os_disk {
    name              = "${vm_name}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
}

   os_profile {
    computer_name  = var.hostname
    admin_username = "yashas"
    admin_password = "17Btrct055$"
  }
   os_profile_linux_config {
    disable_password_authentication = false
  }

}
