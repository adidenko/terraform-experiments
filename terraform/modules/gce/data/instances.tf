module "ignition" {
  source          = "../../coreos/ignition"
  service_name    = "vault.service"
  service_content = <<EOF
[Unit]
Description=Vault Service
Requires=docker.service
Requires=etcd2.service
Requires=coreos-metadata.service
After=docker.service
After=etcd2.service
After=coreos-metadata.service

[Service]
EnvironmentFile=/etc/environment
ExecStartPre=-/usr/bin/docker rm -f %p
ExecStartPre=/usr/bin/docker pull brandfolder/vault-coreos
ExecStart=/usr/bin/docker run \
  --rm \
  --name %p \
  -e SERVICE_NAME=vault \
  -e ETCD_ADDRESS="http://$COREOS_GCE_IP_LOCAL_0:2379" \
  -e ETCD_ADVERTISE_ADDR="http://$COREOS_GCE_IP_LOCAL_0:8200" \
  -e VAULT_LISTEN="0.0.0.0:8200" \
  -e VAULT_TLS_DISABLE=1 \
  -p 8200:8200 \
  --cap-add IPC_LOCK \
  vault
Restart=always
RestartSec=5
EOF

}

resource "google_compute_instance" "vault" {
  name         = "${var.name_prefix}-${count.index + 1}"
  // There can be only one.
  count        = "1"
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

resource "google_dns_managed_zone" "prod" {
  name     = "prod-zone"
  dns_name = "mydomain.int."
}

resource "google_dns_record_set" "vault" {
  name = "vault.${google_dns_managed_zone.prod.dns_name}"
  type = "A"
  ttl  = 60

  managed_zone = "${google_dns_managed_zone.prod.name}"

  rrdatas = ["${google_compute_instance.vault.network_interface.0.access_config.0.assigned_nat_ip}"]
}

resource "google_dns_record_set" "vault_int" {
  name = "vault-int.${google_dns_managed_zone.prod.dns_name}"
  type = "A"
  ttl  = 60

  managed_zone = "${google_dns_managed_zone.prod.name}"

  rrdatas = ["${google_compute_instance.vault.network_interface.0.address}"]
}
