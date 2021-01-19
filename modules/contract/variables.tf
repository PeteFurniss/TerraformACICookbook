variable "contract_list" {
    description = "A list of the Contracts"
    type        = list(map(string))
}

variable "contract_subject_list" {
    description = "A list of the Contract Subjects"
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

