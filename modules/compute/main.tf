resource "azurerm_network_interface" "main" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.ip_allocation
    public_ip_address_id = var.public_ip_address_id
  }
}

resource "azurerm_virtual_machine" "matebox" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = var.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = var.is_os_disks_will_deleted_on_termination

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = var.is_data_disks_will_deleted_on_termination

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.os_hostname
    admin_username = var.admin_username
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = var.public_ssh_key
      path     = "/home/testadmin/.ssh/authorized_keys"
    }
  }
  tags = {
    environment = var.environment
  }
}

resource "azurerm_virtual_machine_extension" "example" {
  name                 = "CustomScript"
  virtual_machine_id   = azurerm_virtual_machine.matebox.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
      "fileUris": ["https://raw.githubusercontent.com/fredisson11/devops_todolist_terraform_task/main/install-app.sh"],
      "commandToExecute": "sh install-app.sh"
    }
  SETTINGS


  tags = {
    environment = var.environment
  }
}