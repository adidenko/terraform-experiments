variable "service_name" {
  default = "example.service"
}

variable "service_content" {
  default = "[Service]\nType=oneshot\nExecStart=/usr/bin/echo Hello World\n\n[Install]\nWantedBy=multi-user.target"
}

output "config" {
  value = "${data.ignition_config.example.rendered}"
}
