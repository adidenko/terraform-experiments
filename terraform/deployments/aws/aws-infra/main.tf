provider "aws" {
  region     = "eu-central-1"
}

# Tables for environments locking

resource "aws_dynamodb_table" "tf-europe-west-coreos_cluster" {
  name           = "tf-europe-west-coreos_cluster"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_dynamodb_table" "tf-europe-west-centos_cluster" {
  name           = "tf-europe-west-centos_cluster"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_dynamodb_table" "tf-europe-west-storage" {
  name           = "tf-europe-west-storage"
  read_capacity  = 2
  write_capacity = 2
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

