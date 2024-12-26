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
  network       = "default"
}
#-----vnet--------------
module "virtual_network" {
  source = "./modules/virtual_network"
  region = var.region
}
