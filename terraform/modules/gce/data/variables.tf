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

variable "use_ignition" {
  default     = false
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
