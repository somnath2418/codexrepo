variable "name" {
  description = "Name of the network security group."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region for the network security group."
  type        = string
}

variable "allowed_rdp_cidr" {
  description = "CIDR range allowed to RDP to the VM."
  type        = string
}

variable "tags" {
  description = "Tags applied to the network security group."
  type        = map(string)
  default     = {}
}
