resource "proxmox_vm_qemu" "prod_microk8s_01" {
  name        = "prod-microk8s-01"
  target_node = "baymax"
  clone = "ubuntu-cloud-shared-baymax"

  sockets = 2
  cores = 3
  memory = 6144

  sshkeys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEn5k5xqBqVg9HqNwOq/TjtvIUc+/vugkDh6PVeI7FYg joe@Joes-MacBook-Pro.local"

  nameserver = "10.1.2.120"
  ipconfig0 = "gw=10.1.2.1,ip=10.1.2.177/24"

  disk {
    type         = "virtio"
    storage      = "baymax-fast"
    size         = "100G"
  }
}

resource "local_file" "ansible_inventory" {
  filename = "../ansible/inventory/remote/hosts.ini"
  content = split("/", substr(proxmox_vm_qemu.prod_microk8s_01.ipconfig0, 15, 18))[0]
}
