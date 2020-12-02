variable "ap_list" {
    description = "A list of the application profiles"
    type        = list(map(string))
}

variable "epg_list" {
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

variable "tenant" {
    description = "The Tenant DN"
    type        = string
}

variable "physical_domain" {
    description = "The id of the physical domain created in the fabric module"
    type        = string
}
