variable "type" {
  default = "f1-micro"
}

variable "instances" {
  default = 1
}

variable "name_prefix" {}

variable "image_project" {}

variable "image_family" {}

variable "project" {}

variable "zone" {}

variable "ssh_user" {}

variable "public_key_path" {}

variable "private_key_path" {}

variable "use_ignition" {
  default     = false
}

variable "install_script_src_path" {
  description = "Path to install script within this repository"
  default     = "./scripts/install.sh"
}

variable "install_script_dest_path" {
  description = "Path to put the install script on each destination resource"
  default     = "/tmp/install.sh"
}

output "vault_int_ip" {
  value = "${google_compute_instance.vault.network_interface.0.address}"
}

output "vault_ext_dns" {
  value = "${google_dns_record_set.vault.name}"
}

output "vault_int_dns" {
  value = "${google_dns_record_set.vault_int.name}"
}
