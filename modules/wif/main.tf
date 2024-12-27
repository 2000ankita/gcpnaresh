# Create Service Account
resource "google_service_account" "workload_sa" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
}

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
  workload_identity_pool_provider_id = google_iam_workload_identity_pool.wif_pool.workload_identity_pool_id
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
  attribute_condition = "request.auth.claims['repository'] == '${var.github_repo}'"
}

# Bind Workload Identity Pool Provider to impersonate the Service Account
resource "google_service_account_iam_binding" "wif_impersonation_binding" {
  service_account_id = google_service_account.workload_sa.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.wif_pool.name}/attribute.mappings.google.subject",
  ]
}
