terraform {
  backend "s3" {
    bucket         = "eu-bucket-01"
    region         = "eu-central-1"
    key            = "terraform/europe-west-storage"
    dynamodb_table = "tf-europe-west-storage"
  }
}

provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

module "data" {
  source                  = "../../../../modules/gce/data"
  name_prefix             = "vault"
  instances               = "1"
  type                    = "${var.type}"
  # Pass region as zone
  zone                    = "${var.region}"
  image_project           = "${var.image_project}"
  image_family            = "${var.image_family}"
  project                 = "${var.project}"
  ssh_user                = "${var.ssh_user}"
  public_key_path         = "${var.public_key_path}"
  private_key_path        = "${var.private_key_path}"
}

output "vault_int_ip" {
  value = "${module.data.vault_int_ip}"
}

output "vault_ext_dns" {
  value = "${module.data.vault_ext_dns}"
}

output "vault_int_dns" {
  value = "${module.data.vault_int_dns}"
}
