# Create Service Account


# Assign roles to the Service Account
resource "google_project_iam_member" "service_account_roles" {
  for_each = toset(var.roles)

  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.workload_sa.email}"
}

# Create Workload Identity Pool
resource "google_iam_workload_identity_pool" "wif_pool" {
  workload_identity_pool_id = var.workload_identity_pool_id
  display_name              = var.pool_display_name
  description               = var.pool_description
  disabled                  = false
}

# Create Workload Identity Provider
resource "google_iam_workload_identity_pool_provider" "wif_provider" {
  workload_identity_pool_id = google_iam_workload_identity_pool.wif_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = var.workload_identity_provider_id
  display_name              = var.provider_display_name
  #provider_id               = var.workload_identity_provider_id
  description               = var.provider_description

  oidc {
    issuer_uri = var.issuer_uri
  }

  attribute_mapping = {
    "google.subject" = "assertion.sub"
  }

  # Allow only the specified GitHub repository
  attribute_condition = "request.auth.claims['sub'] == '${var.github_repo}'"
}

# Bind Workload Identity Pool Provider to impersonate the Service Account
resource "google_service_account_iam_binding" "wif_impersonation_binding" {
  service_account_id = google_service_account.workload_sa.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "principal://iam.googleapis.com/projects/${var.project_id}/locations/global/workloadIdentityPools/${var.workload_identity_pool_id}/attribute.google.subject/repo:2000ankita/python-dockerise-cloudrun:ref:branch:dev"
  ]
}
