output "id" {
  description = "ID of the public IP."
  value       = azurerm_public_ip.this.id
}

output "ip_address" {
  description = "Public IP address."
  value       = azurerm_public_ip.this.ip_address
}
