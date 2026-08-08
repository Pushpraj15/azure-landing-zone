module "resource_group" {
    source = "../../Module/azurerm_resource_group"
    rgs = var.rgfirst
  
}

module "vnet" {
    depends_on = [ module.resource_group ]
    source = "../../Module/azurerm_virtual_network"
    vnets = var.vnets
  
}

module "subnet" {
    depends_on = [ module.vnet ]
    source = "../../Module/azurerm_subnet"
    subnets = var.subnets
  
}

module "pip24" {
    depends_on = [ module.resource_group ]
    source = "../../Module/azurerm_public_ip"
    pip = var.pip
  
}

module "vm24" {
    depends_on = [ module.subnet, module.pip24 ]
    source = "../../Module/azurerm_virtual_machine"
    virtual_machine = var.virtual_machine

}