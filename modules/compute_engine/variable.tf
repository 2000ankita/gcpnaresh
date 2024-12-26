variable "instance_name" {
  description = "Name of the Compute Engine instance"
  type        = string
}

variable "machine_type" {
  description = "Type of machine to create (e.g., e2-micro)"
  type        = string
}

variable "zone" {
  description = "Zone to deploy the instance"
  type        = string
}

variable "disk_image" {
  description = "Image to use for the boot disk"
  type        = string
}

variable "network" {
  description = "Network to attach the instance to"
  type        = string
}
variable "project_id" {
  description = "The project ID where Cloud Run will be created"
  type        = string
  default     = "gcptest-445516"
}