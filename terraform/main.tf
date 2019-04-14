terraform {
  # Версия terraform
  required_version = ">=0.11,<0.12"
}

provider "google" {
  version = "1.19.1"

  # ID проекта
  project = "${var.project}"
  region  = "${var.region}"
}

