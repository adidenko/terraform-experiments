
provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

resource "google_compute_instance" "test" {
  count        = "${var.instances}"
  name         = "ti-${count.index + 1}"
  machine_type = "${var.type}"
  zone         = "${var.region}"

  disk {
    image = "${var.image}"
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP - leaving this block empty will generate a new external IP and assign it to the machine
    }
  }

  metadata {
    ssh-keys = "root:${file("${var.public_key_path}")}"
  }
}
