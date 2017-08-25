#!/bin/bash
# Script to run under CI

set -ex

pushd $1
terraform init
terraform plan
popd
