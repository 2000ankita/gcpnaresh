resource "google_compute_network" "custom_vpc" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "custom_subnet" {
  name          = "custom-subnet"
  ip_cidr_range = "10.0.0.0/24" # Specify your subnet range
  region        = var.region    # Use the region from variables
  network       = google_compute_network.custom_vpc.id
}
