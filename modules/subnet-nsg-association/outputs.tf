output "id" {
  description = "ID of the subnet and NSG association."
  value       = azurerm_subnet_network_security_group_association.this.id
}
