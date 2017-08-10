module "ignition" {
  source = "../../coreos/ignition"
}

resource "google_compute_instance" "node" {
  name         = "${var.name_prefix}-${count.index + 1}"
  count        = "${var.instances}"
  machine_type = "${var.type}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "${var.image_project}/${var.image_family}"
      size  = 50
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP - leaving this block empty will generate a new external
      // IP and assign it to the machine
    }
  }

  metadata {
    ssh-keys  = "${var.ssh_user}:${file("${var.public_key_path}")}"
    user-data = "${var.image_project == "coreos-cloud" ? module.ignition.config : "" }"
  }

  // Provisioning
  provisioner "file" {
    source      = "${var.install_script_src_path}"
    destination = "${var.install_script_dest_path}"

    connection {
      type        = "ssh"
      user        = "${var.ssh_user}"
      private_key = "${file("${var.private_key_path}")}"
      agent       = false
    }
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "${var.ssh_user}"
      private_key = "${file("${var.private_key_path}")}"
      agent       = false
    }

    inline = [
      "chmod +x ${var.install_script_dest_path}",
      "sudo ${var.install_script_dest_path} ${count.index}",
    ]
  }
}
