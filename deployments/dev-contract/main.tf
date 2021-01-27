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

module "contract" {
    source     = "../../modules/contract"

    contract_list                  = csvdecode(file("${path.module}/contract.csv"))
    contract_subject_list          = csvdecode(file("${path.module}/contract_subject.csv"))

    tenant_reference_list          = csvdecode(file("${path.module}/../dev-references/tenant_references.csv"))
    filter_reference_list          = csvdecode(file("${path.module}/../dev-references/filter_references.csv"))
}
