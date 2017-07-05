variable "image" {
  default = "coreos-stable-1409-5-0-v20170623"
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

variable "public_key_path" {
  description = "Path to file containing public key"
  default     = "~/.ssh/id_rsa.pub"
}
