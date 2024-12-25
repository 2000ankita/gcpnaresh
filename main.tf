resource "google_storage_bucket" "my_bucket" {
  name     = "my-unique-gcpnaresh-name-12345"  # A globally unique bucket name
  location = "US"  # Bucket location, modify as needed
}
resource "google_storage_bucket" "my_bucket1" {
  name     = "my-unique-gcpankita-name-12345"  # A globally unique bucket name
  location = "US"  # Bucket location, modify as needed
}

#------------------creating cloud run----------------------
module "cloud_run" {
  source       = "./modules/cloud_run"
  service_name = var.service_name
  location     = var.location
  project_id      = var.project_id
  image_url    = var.image_url
  memory       = var.memory
  cpu          = var.cpu
}
