variable "filter_list" {
    description = "A list of the Filters"
    type        = list(map(string))
}

variable "filter_entry_list" {
    description = "A list of the Filter Entries"
    type        = list(map(string))
}

variable "tenant_reference_list" {
    description = "A list of references to Tenant created outside this module"
    type        = list(map(string))
}

