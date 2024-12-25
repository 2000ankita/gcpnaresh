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
  alias   = "main_project"  # Alias for this provider
  project = "main-project"  # Replace with your main project ID
  region  = "us-central1"   # Replace with your desired region
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
