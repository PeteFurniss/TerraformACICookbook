variable "bridge_domain_list" {
    description = "A list of the bridge_domains"
    type        = list(map(string))
}

variable "tenant_reference_list" {
    description = "A list of references to Tenant created outside this module"
    type        = list(map(string))
}
