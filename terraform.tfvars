environment         = "Development"
resource_group_name = "mate-azure-task-12"
location            = "uksouth"

virtual_network_name        = "vnet"
vnet_address_prefix         = ["10.0.0.0/16"]
subnet_name                 = "default"
subnet_address_prefix       = ["10.0.0.0/24"]
public_ip_address_name      = "linuxboxpip"
ip_allocation               = "Dynamic"
dns_label                   = "matetask"
network_security_group_name = "defaultnsg"

vm_name                                   = "matebox"
vm_size                                   = "Standard_B1s"
os_hostname                               = "hostname"
admin_username                            = "testadmin"
ssh_key_public                            = "~/.ssh/id_rsa.pub"

install_app_script_url = "https://raw.githubusercontent.com/fredisson11/devops_todolist_terraform_task/main/install-app.sh"

storage_account_name_prefix      = "default"
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"
container_name                   = "task-artifacts"
container_access_type            = "private"