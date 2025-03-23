resource "azurerm_network_interface" "main" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "${var.vm_name}-ip-cfg"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.ip_allocation
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_linux_virtual_machine" "matebox" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main.id]
  size               = var.vm_size
  computer_name = var.os_hostname
  admin_username = var.admin_username


  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  admin_ssh_key {
    username   = var.admin_username
    public_key = var.public_ssh_key
  }
  tags = {
    environment = var.environment
  }
}

resource "azurerm_virtual_machine_extension" "example" {
  name                 = "CustomScript"
  virtual_machine_id   = azurerm_linux_virtual_machine.matebox.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
      "fileUris": ["${var.script_url}"],
      "commandToExecute": "bash ${local.script_name}"
    }
  SETTINGS

  tags = {
    environment = var.environment
  }
}
