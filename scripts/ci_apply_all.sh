#!/bin/bash
# Script to run under CI/CD

set -ex

# For planning we don't need real key, so let's create fake key if real one
# does not exist
test -d ~/.ssh || mkdir ~/.ssh
test -e ~/.ssh/google_compute_engine || touch ~/.ssh/google_compute_engine
test -e ~/.ssh/google_compute_engine.pub || touch ~/.ssh/google_compute_engine.pub

pushd $1
terragrunt plan-all
popd
