terraform {
    backend "gcs" {
	bucket = "storage-bucket-passenger"
	prefix = "prod"
    }
}