# Use for Reserved Sandbox
provider "aci" {
    username    = "admin"
    password    = "C1sco12345"
    url         = "https://10.10.20.14"
    insecure    = true
}

# Use for Always-On Sandbox
#provider "aci" {
#    username    = "apic:\\\\admin"
#    password    = "ciscopsdt"
#    url         = "https://sandboxapicdc.cisco.com"
#    insecure    = true
#}

module "filter" {
    source     = "../../modules/filter"

    filter_list                    = csvdecode(file("${path.module}/filter.csv"))
    filter_entry_list              = csvdecode(file("${path.module}/filter_entry.csv"))

    tenant_reference_list          = csvdecode(file("${path.module}/../dev-references/tenant_references.csv"))
}
