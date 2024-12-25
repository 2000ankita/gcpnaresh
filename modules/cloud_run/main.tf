resource "google_cloud_run_service" "service1_test" {
  name     = var.service_name
  location = var.region
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

output "cloud_run_url" {
  value = google_cloud_run_service.service.status[0].url
}
