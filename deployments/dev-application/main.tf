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

module "application" {
    source     = "../../modules/application"

    application_profile_list       = csvdecode(file("${path.module}/application_profile.csv"))
    application_epg_list           = csvdecode(file("${path.module}/application_epg.csv"))
    epg_to_static_path_list        = csvdecode(file("${path.module}/epg_to_static_path.csv"))
    epg_to_domain_list             = csvdecode(file("${path.module}/epg_to_domain.csv"))
    epg_to_contract_list           = csvdecode(file("${path.module}/epg_to_contract.csv"))

    physical_domain_reference_list = csvdecode(file("${path.module}/../dev-references/physical_domain_references.csv"))
    vmm_domain_reference_list      = csvdecode(file("${path.module}/../dev-references/vmm_domain_references.csv"))
    tenant_reference_list          = csvdecode(file("${path.module}/../dev-references/tenant_references.csv"))
    contract_reference_list        = csvdecode(file("${path.module}/../dev-references/contract_references.csv"))
    bridge_domain_reference_list   = csvdecode(file("${path.module}/../dev-references/bridge_domain_references.csv"))
}

