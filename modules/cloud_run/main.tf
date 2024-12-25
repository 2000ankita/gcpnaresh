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

