resource "azurerm_public_ip" "main" {
  name                = "${var.project}-${var.env}-ip"
  resource_group_name = var.resource_group_name
  location            = var.azure_location
  allocation_method   = "Static"

  tags = {
    environment  = var.env
    "cycloid.io" = "true"
  }

}

resource "azurerm_network_interface" "main" {
  name                = "${var.project}-${var.env}-nic"
  location            = var.azure_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.project}-front-${var.env}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
    primary                       = true
  }
  tags = {
    environment  = var.env
    "cycloid.io" = "true"

  }

}

data "template_file" "user_data" {
  template = file("${path.module}/userdata.sh.tpl")

  vars = {
    git_code_commit = var.git_code_commit
    git_code_repo   = var.git_code_repo
    env             = var.env
    project         = var.project
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.project}-front-${var.env}"
  location              = var.azure_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = var.instance_type

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "debian"
    offer     = "debian-10"
    sku       = "10-cloudinit-gen2"
    version   = "latest"
  }

  storage_os_disk {
    name              = "os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "demo"
    admin_username = "cycloid"
    admin_password = "vu5ba2au6eefaica0ship4Ohsai1Ueli"
    custom_data    = data.template_file.user_data.rendered
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment  = var.env
    "cycloid.io" = "true"
  }
}
