variable "vm_name" {
  type        = string
  description = "The VM name"
}

variable "resource_pool_id" {
  type        = string
  description = "Resource Pool ID"
}

variable "datastore_id" {
  type        = string
  description = "Datastore ID"
}

variable "folder_path" {
  type        = string
  description = "Folder path"
}

variable "annotation" {
  type        = string
  description = "Annoation for VM"
  default     = "Photon VM"
}

variable "network_id" {
  type        = string
  description = "Network ID"
}

variable "num_cpus" {
  type        = number
  description = "Number of CPUs"
}

variable "memory" {
  type        = number
  description = "Memory in megabytes"
}

variable "guest_id" {
  type        = string
  description = "Guest ID"
  default     = "vmwarePhoton64Guest"
}

variable "firmware" {
  type        = string
  description = "Firmware type (efi or bios)"
  default     = "efi"
}

variable "disk_size" {
  type        = number
  description = "Disk size in gigabytes"
  default     = 20
}

variable "template_uuid" {
  type        = string
  description = "Template UUID"
}

variable "metadata" {
  type        = string
  description = "Metadata for cloud-init"
}

variable "userdata" {
  type        = string
  description = "Userdata for cloud-init"
}
