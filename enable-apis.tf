provider "google" {
  alias   = "host_project"  # Alias for the host project provider
  project = "host-project"  # Replace with your host project ID
  region  = "us-central1"   # Replace with your desired region
}

# List of APIs to enable
variable "apis" {
  default = [
    "compute.googleapis.com",          # Compute Engine API
    "cloudresourcemanager.googleapis.com", # Cloud Resource Manager API
    "cloudbilling.googleapis.com"     # Cloud Billing API
  ]
}

# Enable APIs using a for_each loop
resource "google_project_service" "enabled_apis" {
  for_each = toset(var.apis)

  project = "host-project" # Replace with your project ID
  service = each.value
}
