resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id
  folder           = var.folder_path

  annotation                       = var.annotation
  num_cpus                         = var.num_cpus
  memory                           = var.memory
  guest_id                         = "vmwarePhoton64Guest"
  sync_time_with_host              = true
  sync_time_with_host_periodically = true
  firmware                         = "efi"

  network_interface {
    network_id = var.network_id
  }

  disk {
    label            = "disk0"
    size             = var.disk_size
    thin_provisioned = true
  }

  clone {
    template_uuid = var.template_uuid
  }

  extra_config = {
    "guestinfo.metadata"          = var.metadata
    "guestinfo.metadata.encoding" = "base64"
    "guestinfo.userdata"          = var.userdata
    "guestinfo.userdata.encoding" = "base64"
  }
}

output "default_ip_address" {
  value = vsphere_virtual_machine.vm.default_ip_address
}

output "name" {
  value = vsphere_virtual_machine.vm.name
}
