variable "region" {
  default = "europe-west2-a" // We're going to need it in several places in this config
}

provider "google" {
  credentials = "${file("account.json")}"
  project     = "ad-api-167408"
  region      = "${var.region}"
}

resource "google_compute_instance" "test" {
  count        = 1 // Adjust as desired
  name         = "ti-${count.index + 1}" // yields "test1", "test2", etc. It's also the machine's name and hostname
  machine_type = "f1-micro" // smallest (CPU &amp; RAM) available instance
  zone         = "${var.region}" // yields "europe-west1-d" as setup previously. Places your VM in Europe

  disk {
    image = "coreos-stable-1409-5-0-v20170623" // the operative system (and Linux flavour) that your machine will run
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP - leaving this block empty will generate a new external IP and assign it to the machine
    }
  }
}
