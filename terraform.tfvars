#variable for compute engine
project_id     = "gcptest-445516"
region         = "us-central1"
zone           = "us-central1-a"
machine_type   = "e2-standard-4"
disk_image     = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
instance_name  = "dev-instance"

#vnet
network_name = "custom-vpc"

#wif
service_account_id = "workload-identity-sa"
service_account_display_name = "Workload Identity Service Account"
