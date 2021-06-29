module "disable-service-account-key-creation" {
  count           = local.is_iam || local.is_sec ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 3.0.2"
  policy_for      = "organization"
  constraint      = "constraints/iam.disableServiceAccountKeyCreation"
  policy_type     = "boolean"
  organization_id = data.google_organization.org.org_id
  enforce         = true
}

module "disable-service-account-key-upload" {
  count           = local.is_iam || local.is_sec ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 3.0.2"
  policy_for      = "organization"
  constraint      = "constraints/iam.disableServiceAccountKeyUpload"
  policy_type     = "boolean"
  organization_id = data.google_organization.org.org_id
  enforce         = true
}

#module "resourceLocations" {
#  count             = local.is_gcp || local.is_sec ? 1 : 0
#  source            = "terraform-google-modules/org-policy/google"
#  version           = "~> 3.0.2"
#  policy_for        = "organization"
#  constraint        = "constraints/gcp.resourceLocations"
#  allow             = var.resource_location_list
#  allow_list_length = length(var.resource_location_list)
#  policy_type       = "boolean"
#  organization_id   = data.google_organization.org.org_id
#  enforce           = true
#}

module "detailed-audit-logging-mode" {
  count           = local.is_audit ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 3.0.2"
  policy_for      = "organization"
  constraint      = "constraints/gcp.detailedAuditLoggingMode"
  policy_type     = "boolean"
  organization_id = data.google_organization.org.org_id
  enforce         = true
}

module "require-os-login" {
  count           = local.is_compute || local.is_sec ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 3.0.2"
  policy_for      = "organization"
  constraint      = "constraints/compute.requireOsLogin"
  policy_type     = "boolean"
  organization_id = data.google_organization.org.org_id
  enforce         = true
}

module "require-shielded-vm" {
  count           = local.is_compute || local.is_sec ? 1 : 0
  source          = "terraform-google-modules/org-policy/google"
  version         = "~> 3.0.2"
  policy_for      = "organization"
  constraint      = "constraints/compute.requireShieldedVm"
  policy_type     = "boolean"
  organization_id = data.google_organization.org.org_id
  enforce         = true
}

#module "allowed-policy-member-domains" {
  #count             = local.is_iam || local.is_sec ? 1 : 0
#  source            = "terraform-google-modules/org-policy/google"
#  policy_for        = "organization"
#  organization_id   = data.google_organization.org.org_id
#  constraint        = "constraints/iam.allowedPolicyMemberDomains"
#  policy_type       = "list"
#  allow             = [for org in data.google_organization.orgs : org["directory_customer_id"]]
#  allow_list_length = length(var.domains)
#}
