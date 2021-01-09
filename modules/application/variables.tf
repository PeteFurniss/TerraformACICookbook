variable "application_profile_list" {
    description = "A list of the application profiles"
    type        = list(map(string))
}

variable "application_epg_list" {
    description = "A list of the EPGs"
    type        = list(map(string))
}

variable "epg_to_static_path_list" {
    description = "A list of the EPG to Static Path mappings"
    type        = list(map(string))
}

variable "epg_to_domain_list" {
    description = "A list of the EPG to Domain mappings"
    type        = list(map(string))
}

variable "contract_list" {
    description = "A list of the Contracts"
    type        = list(map(string))
}

variable "epg_to_contract_list" {
    description = "A list of the EPG to Contract mappings"
    type        = list(map(string))
}

variable "contract_subject_list" {
    description = "A list of the Contract Subjects"
    type        = list(map(string))
}

variable "filter_list" {
    description = "A list of the Filters"
    type        = list(map(string))
}

variable "filter_entry_list" {
    description = "A list of the Filter Entries"
    type        = list(map(string))
}

variable "filter_reference_list" {
    description = "A list of references to Filters to attach to Contract Subjects"
    type        = list(map(string))
}

variable "tenant_reference_list" {
    description = "A list of references to Tenant created outside this module"
    type        = list(map(string))
}

variable "bridge_domain_reference_list" {
    description = "A list of references to Bridge Domains created outside this module"
    type        = list(map(string))
}

variable "physical_domain" {
    description = "The id of the physical domain created in the fabric module"
    type        = string
}
