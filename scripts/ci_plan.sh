#!/bin/bash
set -ex

pushd $1
terraform init
terraform plan
popd
