variable "cluster_name" {}

variable "image_project" {}

variable "image_family" {}

variable "type" {}

variable "instances" {}

variable "project" {}

variable "region" {}

variable "ssh_user" {}

variable "public_key_path" {
  description = "Path to file containing public key"
  default     = "~/.ssh/google_compute_engine.pub"
}

variable "private_key_path" {
  description = "Path to file containing private key"
  default     = "~/.ssh/google_compute_engine"
}

variable "install_script_src_path" {
  description = "Path to install script within this repository"
  default     = "./scripts/install.sh"
}
