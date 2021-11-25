module "vm" {
    source = "./modules/vm"
    resource_group_name = var.resource_group_name
    network_subnet_name = var.network_subnet_name
    virtual_network_name = var.virtual_network_name
    network_interface_name = var.network_interface_name
    network_security_group = var.network_security_group
    vm_name             = var.vm_name
    vm_size             = var.vm_size
    hostname            = var.hostname
}

