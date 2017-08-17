variable "name" {
  default = "storage"
}

variable "image_project" {
  default = "coreos-cloud"
}

variable "image_family" {
  default = "coreos-alpha"
}

variable "type" {
  default = "f1-micro"
}

variable "instances" {
  default = 1
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
