terraform {
  required_version = ">= 1.0.0"  # Specifies Terraform version

  required_providers {
    google = {
      source  = "hashicorp/google"  # Specifies the source for the Google Cloud provider
      version = "~> 4.0"            # Restricting to a specific range of provider versions
    }
  }
}

provider "google" {
  project = "gcptest-445516"  # Your GCP project ID
  region  = "us-central1"     # Your desired region
}

resource "google_storage_bucket" "my_bucket" {
  name     = "my-unique-gcpnaresh-name-12345"  # A globally unique bucket name
  location = "US"  # Bucket location, modify as needed
}
resource "google_storage_bucket" "my_bucket1" {
  name     = "my-unique-gcpankita-name-12345"  # A globally unique bucket name
  location = "US"  # Bucket location, modify as needed
}
output "bucket_name" {
  value = google_storage_bucket.my_bucket.name
}


provider "google" {
  project = var.project
  region  = var.region
}

module "cloud_run" {
  source       = "./modules/cloud_run"
  service_name = var.service_name
  location     = var.location
  project      = var.project_id
  image_url    = var.image_url
  memory       = var.memory
  cpu          = var.cpu
}

output "cloud_run_service_url" {
  value = module.cloud_run.cloud_run_url
}
