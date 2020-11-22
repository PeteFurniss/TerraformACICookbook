variable "ap_list" {
    description = "A list of the application profiles"
    type        = list(map(string))
}

variable "epg_list" {
    description = "A list of the EPGs"
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