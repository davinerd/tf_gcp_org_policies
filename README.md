# GCP Organisational Policies

This module allows you to enable [GCP organizational policies](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints) via categories.
Each policy is associated with one or more categories.

Following categories are implemented:
- IAM (`iam`)
- Security (`sec`)
- Audit (`audit`)
- Compute (`compute`)
- GCP operations level (`gcp`)

This is the table:

|  Policy Name | Description   | Categories  |
|---|---|---|
| _disableServiceAccountKeyCreation_ | disables the creation of service account external keys where this constraint is set to `True`. By default, service account external keys can be created by users based on their Cloud IAM roles and permissions. |  `iam`, `sec` |
| _disableServiceAccountKeyUpload_ |disables the feature that allows uploading public key to service account where this constraint is set to `True`. By default, users can upload public key to service account based on their Cloud IAM roles and permissions. |  `iam`, `sec` |
| _detailedAuditLoggingMode_ | When Detailed Audit Logging Mode is enforced, both the request and response are included in Cloud Audit Logs. |  `audit` |
| _requireOsLogin_ | enables OS Login on all newly created Projects. All VM instances created in new projects will have OS Login enabled. On new and existing projects, this constraint prevents metadata updates that disable OS Login at the project or instance level. GKE instances do not currently support OS Login. If this constraint is applied to a Project, GKE instances running in that Project may not function properly. | `compute` |
| _requireShieldedVm_ | requires that all new Compute Engine VM instances use Shielded disk images with Secure Boot, vTPM, and Integrity Monitoring options enabled. Secure Boot can be disabled after creation, if desired. Existing running instances will continue to work as usual. | `compute`, `sec` |


# Example
```
module "org_constraints" {
    source = "github.com/davinerd/tf_gcp_org_policies"
    enabled_constraints = ["sec"]
    resource_location_list = ["in:europe-locations"]
    domain = "dab.solutions"
}
```