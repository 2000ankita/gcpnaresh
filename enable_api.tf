resource "google_project_service" "compute_engine_api" {
  project = var.project_id
  service = "compute.googleapis.com"
}

resource "google_project_service" "enterprise_api" {
  project = var.project_id
  service = "cloudenterprise.googleapis.com"
}