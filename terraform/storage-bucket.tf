provider "google" {
    version = "2.0.0"
    project = "${var.project}"
    region = "${var.region}"
}

//module "storage-bucket" {
//    source = "SweetOps/storage-bucket/google"
//    version = "0.1.1"
//    name = ["storage-bucket-passenger","storage-bucket-passenger2"]
//}

output storge-bucket_url {
    value = "${module.storage-bucket.url}"
}

resource "google_storage_bucket" "default" {
  name          = "storage-bucket-passenger"
  force_destroy = "true"

  versioning {
    enabled = "true"
  }
}