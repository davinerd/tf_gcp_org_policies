variable "enabled_constraints" {
  type = list(string)
  # accepted value:
  # - sec
  # - iam
  # - audit
  # - compute
  # - gcp
  default = []
}

# https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints#constraints-supported-by-multiple-google-cloud-services
variable "resource_location_list" {
  type = list(string)
  default = []
}

#variable "domains" {
#  type = list(string)
#}

variable "domain" {
  type = string
}