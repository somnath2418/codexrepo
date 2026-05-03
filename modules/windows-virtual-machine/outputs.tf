output "id" {
  description = "ID of the Windows VM."
  value       = azurerm_windows_virtual_machine.this.id
}

output "name" {
  description = "Name of the Windows VM."
  value       = azurerm_windows_virtual_machine.this.name
}
