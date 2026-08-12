rgfirst = {
    rg1 = {
        name = "rg24july"
        location = "centralindia"
    }
        rg2 = {
        name = "rg8aug"
        location = "centralindia"
    }
            rg3 = {
        name = "rg12aug"
        location = "centralindia"
    }

}

vnets = {
    vnet1 = {
            name                = "vnet24July"
            location            = "centralindia"
            resource_group_name = "rg24july"
            address_space       = ["10.0.0.0/16"]
    }
}

subnets ={
    sbnet1 = {
            name                 = "frontend_subnet"
            resource_group_name  = "rg24july"
            virtual_network_name = "vnet24July"
            address_prefixes     = ["10.0.1.0/24"]
    }
    sbnet2 = {
            name                 = "backend_subnet"
            resource_group_name  = "rg24july"
            virtual_network_name = "vnet24July"
            address_prefixes     = ["10.0.2.0/24"]
    }
}

pip ={
    pip1 = {
            name                = "frontentpip"
            resource_group_name = "rg24july"
            location            = "centralindia"
            allocation_method   = "Static"
    }
}

virtual_machine = {
    vm1 = {

        nic_name = "fontend_nic"
        nic_location = "centralindia"
        resource_group_name = "rg24july"
        vm_name = "frontend-vm"
        vm_location = "centralindia"
        vm_size = "Standard_D4_v5"
        vm_user = "testadmin"
        vm_password = "Password1234!"
        publisher = "MicrosoftWindowsServer"
        offer = "WindowsServer"
        sku = "2016-Datacenter"
        version = "latest"
        subnet_name = "frontend_subnet"
        virtual_network_name = "vnet24July"
        pip_name = "frontentpip"
    } 
}