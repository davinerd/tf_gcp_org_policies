data "google_organization" "org" {
  domain = var.domain
}

#data "google_organization" "orgs" {
#  for_each = toset(var.domains)
#  domain   = each.value
#}