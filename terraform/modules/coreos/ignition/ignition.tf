data "ignition_systemd_unit" "example" {
  name = "example.service"
  content = "[Service]\nType=oneshot\nExecStart=/usr/bin/echo Hello World\n\n[Install]\nWantedBy=multi-user.target"
}

data "ignition_config" "example" {
  systemd = [
    "${data.ignition_systemd_unit.example.id}",
  ]
}
