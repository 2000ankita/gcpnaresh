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


#------------------compute_enginer------------------
module "compute_engine" {
  source        = "./modules/compute_engine"
  instance_name = var.instance_name
  machine_type  = var.machine_type
  zone          = var.zone
  disk_image    = var.disk_image
  network_name  = module.virtual_network.custom_vpc_name # Pass the correct network name
}

#-----vnet--------------
module "virtual_network" {
  source = "./modules/virtual_network"
  region = var.region
}
#----------------wif---------------


module "workload_identity_federation" {
  source = "./modules/wif"

  service_account_id          = "workload-identity-sa"
  service_account_display_name = "Workload Identity Service Account"
  project_id                  = var.project_id
  roles                       = ["roles/storage.admin", "roles/pubsub.publisher"]

  workload_identity_pool_id   = "my-workload-identity-pool"
  pool_display_name           = "My Workload Identity Pool"
  pool_description            = "Workload Identity Pool for external identities"

  workload_identity_provider_id = "my-oidc-provider"
  provider_display_name         = "OIDC Provider"
  provider_description          = "OIDC Provider for GitHub Actions"

  issuer_uri                  = "https://token.actions.githubusercontent.com"
  github_repo                 = "2000ankita/python-dockerise-cloudrun" 
  #audiences = ["https://iam.googleapis.com/"] # Allow this GitHub repository
}
