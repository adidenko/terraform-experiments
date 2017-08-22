terragrunt = {
  dependencies {
    paths = ["../../../aws/aws-infra"]
  }
}

name = "storage"

image_project = "coreos-cloud"

image_family = "coreos-alpha"

type = "f1-micro"

instances = 1

project = "ad-api-167408"

region = "europe-west2-a"

ssh_user = "slivarez"

public_key_path = "~/.ssh/google_compute_engine.pub"

private_key_path = "~/.ssh/google_compute_engine"
