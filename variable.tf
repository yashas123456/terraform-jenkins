variable "resource_group_name" {
    type = string
}

variable "network_subnet_name" {
    type = string
}
variable "virtual_network_name" {
    type = string
}

# variable "vm_count" {
#     type = number
# }
#variable "network_interface_name" {
    #type = string
#}

variable "network_security_group" {
    type = string
}

#variable "vm_name" {
 #   type = list(string)
#}

variable "vm_size" {
    type = list(string)
}
#variable "hostname" {
    #type = string
#}
