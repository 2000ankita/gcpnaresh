variable "service_account_id" {
  description = "Unique ID for the service account"
  type        = string
}

variable "service_account_display_name" {
  description = "Display name for the service account"
  type        = string
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "roles" {
  description = "Roles to assign to the service account"
  type        = list(string)
}

variable "workload_identity_pool_id" {
  description = "ID for the Workload Identity Pool"
  type        = string
}

variable "pool_display_name" {
  description = "Display name for the Workload Identity Pool"
  type        = string
}

variable "pool_description" {
  description = "Description for the Workload Identity Pool"
  type        = string
}

variable "workload_identity_provider_id" {
  description = "ID for the Workload Identity Provider"
  type        = string
}

variable "provider_display_name" {
  description = "Display name for the Workload Identity Provider"
  type        = string
}

variable "provider_description" {
  description = "Description for the Workload Identity Provider"
  type        = string
}

variable "issuer_uri" {
  description = "OIDC Issuer URI"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository to allow (e.g., 'my-org/my-repo')"
  type        = string
}
