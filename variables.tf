variable "resource_group_name" {
  description = "Name of the Azure resource group to create."
  type        = string
  default     = "rg-demo-vm"
}

variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "centralindia"
}

variable "vm_name" {
  description = "Name of the virtual machine."
  type        = string
  default     = "demo-vm"
}

variable "admin_username" {
  description = "Admin username for RDP access."
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the Windows VM."
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "Azure VM size."
  type        = string
  default     = "Standard_B1s"
}

variable "allowed_rdp_cidr" {
  description = "CIDR range allowed to RDP to the VM. Replace the default with your public IP /32 for better security."
  type        = string
  default     = "0.0.0.0/0"
}

variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
  default = {
    environment = "demo"
    managed_by  = "terraform"
  }
}
