variable "project_id" {
  description = "The project ID where Cloud Run will be created"
  type        = string
  default     = "gcptest-445516"
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
  default     = "cloudrun-service-1"
}

variable "location" {
  description = "The location for the Cloud Run service"
  type        = string
  default     = "us-central1"
}

variable "image_url" {
  description = "The container image URL for the Cloud Run service"
  type        = string
  default = "us-docker.pkg.dev/cloudrun/container/hello"
}

variable "memory" {
  description = "The memory limit for the Cloud Run service"
  type        = string
  default     = "512Mi"
}

variable "cpu" {
  description = "The CPU limit for the Cloud Run service"
  type        = string
  default     = "1"
}


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

variable "network_name" {
  description = "The region for the subnet"
  type        = string
}