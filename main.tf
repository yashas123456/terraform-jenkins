module "vm" {
    source = "./modules/vm"
    #vm_count = 2
    count = length($vm_name)
    vm_name = "${"${vm_name}"[count.index]}"
    resource_group_name = var.resource_group_name
    network_subnet_name = var.network_subnet_name
    virtual_network_name = var.virtual_network_name
    network_interface_name = "${"${vm_name}"[count.index]}"
    network_security_group = var.network_security_group
    #vm_name             = var.vm_name
    vm_size             = "${"${vm_size}"[count.index]}"
    hostname            = "${"${vm_name}"[count.index]}"
}

