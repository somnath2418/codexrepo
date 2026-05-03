output "public_ip_address" {
  description = "Public IP address of the VM."
  value       = module.public_ip.ip_address
}

output "rdp_target" {
  description = "Address to use for RDP after Terraform apply completes."
  value       = module.public_ip.ip_address
}

output "rdp_username" {
  description = "Username to use for RDP."
  value       = var.admin_username
}

output "vm_id" {
  description = "ID of the Windows VM."
  value       = module.windows_virtual_machine.id
}
