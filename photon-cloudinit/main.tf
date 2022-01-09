data "template_file" "metadata" {
  template = file("${path.module}/cloudinit/metadata.tmpl.yaml")

  vars = {
    instance_id    = var.instance_id
    local_hostname = var.local_hostname
    interface      = var.interface
  }
}

output "metadata" {
  value       = base64encode(data.template_file.metadata.rendered)
  description = "Base64 encoded metadata"
}

data "template_file" "userdata" {
  template = file("${path.module}/cloudinit/userdata.tmpl.yaml")

  vars = {
    root_password      = var.encrypted_root_password
    photon_ssh_pub_key = chomp(file("${var.ssh_pub_key_path}"))
    encoded_packages   = jsonencode(concat(["sudo"], var.packages))
    additional         = var.additional_userdata
  }
}

output "userdata" {
  value       = base64encode(data.template_file.userdata.rendered)
  description = "Base64 encoded userdata"
}
