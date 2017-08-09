variable "type" {
  default = "f1-micro"
}

variable "instances" {
  default = 1
}

variable "name_prefix" {}

variable "image" {}

variable "project" {}

variable "zone" {}

variable "ssh_user" {}

variable "public_key_path" {}

variable "private_key_path" {}

variable "install_script_src_path" {
  description = "Path to install script within this repository"
  default     = "./scripts/install.sh"
}

variable "install_script_dest_path" {
  description = "Path to put the install script on each destination resource"
  default     = "/tmp/install.sh"
}