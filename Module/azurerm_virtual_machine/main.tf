resource "azurerm_network_interface" "nic24" {
    for_each = var.virtual_machine
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm24" {
    for_each = var.virtual_machine
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.vm_location
  size                = each.value.vm_size
  admin_username      = each.value.vm_user
  admin_password      = each.value.vm_password
  network_interface_ids = [azurerm_network_interface.nic24[each.key].id,]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}