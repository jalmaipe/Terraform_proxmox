# main.tf

terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url   = var.pm_api_url
  pm_api_token = var.pm_api_token
  insecure     = true  # Set to false if you have valid SSL
}

resource "proxmox_vm_qemu" "vm" {
  name        = var.vm_name
  target_node = var.target_node
  clone       = var.template_name

  memory  = var.vm_memory
  cores   = var.vm_cores
  sockets = 1

  disk {
    size         = "10G"
    type         = "scsi"
    storage      = "local-lvm"
    storage_type = "lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  os_type     = "cloud-init"
  ipconfig0   = "ip=dhcp"
  ciuser      = "ubuntu"
  cipassword  = "ubuntu123"

  sshkeys     = file("~/.ssh/id_rsa.pub")
}
