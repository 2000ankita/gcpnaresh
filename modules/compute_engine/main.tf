resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  network_interface {
    network    = "projects/gcptest-445516/global/networks/custom-vpc"
    subnetwork = "projects/gcptest-445516/regions/us-central1/subnetworks/custom-subnet"

    access_config {
      // Ephemeral public IP
    }
  }
}
