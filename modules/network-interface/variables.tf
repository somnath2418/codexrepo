variable "name" {
  description = "Name of the network interface."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region for the network interface."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet."
  type        = string
}

variable "public_ip_id" {
  description = "ID of the public IP."
  type        = string
}

variable "tags" {
  description = "Tags applied to the network interface."
  type        = map(string)
  default     = {}
}
