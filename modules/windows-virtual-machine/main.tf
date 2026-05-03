resource "azurerm_windows_virtual_machine" "this" {
  name                  = var.name
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = var.size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = var.network_interface_ids
  tags                  = var.tags

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}
