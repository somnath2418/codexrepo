module "resource_group" {
  source = "./modules/resource-group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "virtual_network" {
  source = "./modules/virtual-network"

  name                = "${var.vm_name}-vnet"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  address_space       = ["10.10.0.0/16"]
  tags                = var.tags
}

module "subnet" {
  source = "./modules/subnet"

  name                 = "default"
  resource_group_name  = module.resource_group.name
  virtual_network_name = module.virtual_network.name
  address_prefixes     = ["10.10.1.0/24"]
}

module "network_security_group" {
  source = "./modules/network-security-group"

  name                = "${var.vm_name}-nsg"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  allowed_rdp_cidr    = var.allowed_rdp_cidr
  tags                = var.tags
}

module "subnet_nsg_association" {
  source = "./modules/subnet-nsg-association"

  subnet_id                 = module.subnet.id
  network_security_group_id = module.network_security_group.id
}

module "public_ip" {
  source = "./modules/public-ip"

  name                = "${var.vm_name}-pip"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  tags                = var.tags
}

module "network_interface" {
  source = "./modules/network-interface"

  name                = "${var.vm_name}-nic"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.subnet.id
  public_ip_id        = module.public_ip.id
  tags                = var.tags
}

module "windows_virtual_machine" {
  source = "./modules/windows-virtual-machine"

  name                  = var.vm_name
  resource_group_name   = module.resource_group.name
  location              = module.resource_group.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [module.network_interface.id]
  tags                  = var.tags
}
