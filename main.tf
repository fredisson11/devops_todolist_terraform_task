resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./modules/network"
  environment         = var.environment
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  virtual_network_name          = var.virtual_network_name
  virtual_network_address_space = var.vnet_address_prefix
  subnet_name                   = var.subnet_name
  subnet_address_space          = var.subnet_address_prefix

  public_ip_name              = var.public_ip_address_name
  ip_allocation               = var.ip_allocation
  ip_sku                      = var.ip_sku
  domain_name_prefix          = var.dns_label
  network_security_group_name = var.network_security_group_name
}

module "compute" {
  source              = "./modules/compute"
  environment         = var.environment
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  subnet_id            = module.network.subnet_id
  ip_allocation        = var.ip_allocation
  public_ip_address_id = module.network.public_ip_id

  vm_name        = var.vm_name
  vm_size        = var.vm_size
  os_hostname    = var.os_hostname
  admin_username = var.admin_username

  is_os_disks_will_deleted_on_termination   = var.is_os_disks_will_deleted_on_termination
  is_data_disks_will_deleted_on_termination = var.is_data_disks_will_deleted_on_termination

  public_ssh_key = local.public_ssh_key
  script_url     = var.install_app_script_url
}

module "storage" {
  source              = "./modules/storage"
  environment         = var.environment
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location

  sa_name_prefix      = var.storage_account_name_prefix
  sa_tier             = var.storage_account_tier
  sa_replication_type = var.storage_account_replication_type

  container_name        = var.container_name
  container_access_type = var.container_access_type
}