locals {
    is_iam = contains(var.enabled_constraints, "iam")
    is_sec = contains(var.enabled_constraints, "sec")
    is_gcp = contains(var.enabled_constraints, "gcp")
    is_compute = contains(var.enabled_constraints, "compute")
    is_audit = contains(var.enabled_constraints, "audit")
}