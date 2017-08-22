terragrunt = {
  dependencies {
    paths = ["../europe-west-storage"]
  }
}

cluster_name = "coreos-test"

image_project = "coreos-cloud"

image_family = "coreos-alpha"

type = "f1-micro"

instances = 3

project = "ad-api-167408"

region = "europe-west2-a"

ssh_user = "slivarez"

public_key_path = "~/.ssh/google_compute_engine.pub"

private_key_path = "~/.ssh/google_compute_engine"

install_script_src_path = "./scripts/install.sh"
