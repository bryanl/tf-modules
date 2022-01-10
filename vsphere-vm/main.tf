resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  resource_pool_id = var.resource_pool_id
  datastore_id     = var.datastore_id
  folder           = var.folder_path

  annotation = var.annotation
  num_cpus   = var.num_cpus
  memory     = var.memory
  guest_id   = var.guest_id
  firmware   = var.firmware

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


