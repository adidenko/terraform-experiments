provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

module "compute" {
  source                  = "../../../../modules/gce/compute"
  name_prefix             = "${var.cluster_name}"
  instances               = "${var.instances}"
  type                    = "${var.type}"
  # Pass region as zone
  zone                    = "${var.region}"
  image                   = "${var.image}"
  project                 = "${var.project}"
  ssh_user                = "${var.ssh_user}"
  public_key_path         = "${var.public_key_path}"
  private_key_path        = "${var.private_key_path}"
  install_script_src_path = "${var.install_script_src_path}"
}
