variable "project_id" {
  description = "The project ID where Cloud Run will be created"
  type        = string
  default     = "gcptest-445516"
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = us-central1
}

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
  default     = "cloudrun-service-1"
}

variable "location" {
  description = "The location for the Cloud Run service"
  type        = string
  default     = us-central1
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
