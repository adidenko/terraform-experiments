data "ignition_systemd_unit" "example" {
  name = "${var.service_name}"
  content = "${var.service_content}"
}

data "ignition_config" "example" {
  systemd = [
    "${data.ignition_systemd_unit.example.id}",
  ]
}
