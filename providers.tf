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
