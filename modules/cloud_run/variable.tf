variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
}

variable "location" {
  description = "The location for the Cloud Run service"
  type        = string
}

variable "project" {
  description = "The project ID where Cloud Run will be created"
  type        = string
}

variable "image_url" {
  description = "The container image URL for the Cloud Run service"
  type        = string
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
