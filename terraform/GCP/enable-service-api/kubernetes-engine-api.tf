resource "google_project_service" "gke" {
  project                    = var.gcp_project
  service                    = "container.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy         = true
}
