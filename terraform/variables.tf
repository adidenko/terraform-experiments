variable "image" {
//  default = "coreos-stable-1409-5-0-v20170623"
  default = "centos-cloud/centos-7"
}

variable "type" {
  default = "f1-micro"
}

variable "instances" {
  default = 3
}

variable "project" {
  default = "ad-api-167408"
}

variable "region" {
  default = "europe-west2-a"
}

variable "ssh_user" {
  default = "slivarez"
}

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
  default     = "scripts/install.sh"
}

variable "install_script_dest_path" {
  description = "Path to put the install script on each destination resource"
  default     = "/tmp/install.sh"
}
