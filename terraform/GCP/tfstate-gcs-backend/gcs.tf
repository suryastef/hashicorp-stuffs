# Create a GCS Bucket
resource "google_storage_bucket" "tf_state" {
  project                     = var.gcp_project
  name                        = var.bucket-name
  location                    = var.gcp_region
  force_destroy               = false
  storage_class               = var.storage-class
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  logging {
    log_bucket = var.log-bucket-name
  }
}

output "gcs_terraform_state_buckets" {
  description = "The Cloud Storage buckets used for storing terraform states."
  value       = google_storage_bucket.tf_state.name
}
