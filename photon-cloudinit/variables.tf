variable "instance_id" {
  type        = string
  description = "The vCenter instance id"
}

variable "local_hostname" {
  type        = string
  description = "The hostname for the instance"
}

variable "interface" {
  type        = string
  description = "network interface"
  default     = "eth0"
}

variable "username" {
  type        = string
  description = "user name"
}

variable "ssh_pub_key_path" {
  type        = string
  description = "Path to an SSH publick key"
}

variable "encrypted_root_password" {
  type        = string
  description = "Encrypted root password"
}

variable "packages" {
  description = "Packages to install"
  type        = list(string)
  default     = []
}

variable "additional_userdata" {
  description = "Additional userdata configuration as a string"
  type        = string
  default     = ""
}
