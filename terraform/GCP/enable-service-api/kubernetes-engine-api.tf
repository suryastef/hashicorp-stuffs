resource "google_project_service" "project" {
  project = "sandbox-suryastef"
  service = "container.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
  disable_on_destroy   = true
}
