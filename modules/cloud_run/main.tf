resource "google_cloud_run_service" "service1_test" {
  name     = var.service_name
  location = var.location
  project  = var.project_id

  template {
    spec {
      containers {
        image = var.image_url
        ports {
          container_port = var.port
        }
      }
    }
  }

  traffic {
    latest_revision = true
    percent         = 100
  }
}

# Allow unauthenticated access
resource "google_cloud_run_service_iam_binding" "allow_unauthenticated" {
  location    = google_cloud_run_service.default.location
  service     = google_cloud_run_service.default.name
  role        = "roles/run.invoker"
  members     = ["allUsers"]
}
