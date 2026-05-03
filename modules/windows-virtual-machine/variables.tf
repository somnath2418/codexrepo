variable "name" {
  description = "Name of the Windows virtual machine."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region for the Windows virtual machine."
  type        = string
}

variable "size" {
  description = "Azure VM size."
  type        = string
}

variable "admin_username" {
  description = "Admin username for RDP access."
  type        = string
}

variable "admin_password" {
  description = "Admin password for the Windows VM."
  type        = string
  sensitive   = true
}

variable "network_interface_ids" {
  description = "Network interface IDs attached to the VM."
  type        = list(string)
}

variable "os_disk_storage_account_type" {
  description = "Storage account type for the OS disk."
  type        = string
  default     = "Standard_LRS"
}

variable "tags" {
  description = "Tags applied to the Windows virtual machine."
  type        = map(string)
  default     = {}
}
