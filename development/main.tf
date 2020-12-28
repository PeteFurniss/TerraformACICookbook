# Use for Reserved Sandbox
provider "aci" {
    username    = "admin"
    password    = "C1sco12345"
    url         = "https://10.10.20.14"
    insecure    = true
}

# Use for Always-On Sandbox
#provider "aci" {
#    username    = "admin"
#    password    = "ciscopsdt"
#    url         = "https://sandboxapicdc.cisco.com"
#    insecure    = true
#}

module "fabric" {
    source = "../modules/fabric"

    leaf_pair_map  = csvdecode(file("${path.module}/leaf_pairs.csv"))
    leaf_port_map  = csvdecode(file("${path.module}/leaf_ports.csv"))
}

data "aci_physical_domain" "BareMetal" {
    name =       "BareMetal"
    depends_on = [module.fabric]
}

module "tenant" {
    source = "../modules/tenant"
    depends_on = [module.fabric]

    physical_domain = data.aci_physical_domain.BareMetal.id
}

data "aci_tenant" "PNF_Tenant" {
    name       = "PNF_Tenant"
    depends_on = [module.tenant]
}

module "application" {
    source     = "../modules/application"
    depends_on = [module.tenant]

    ap_list                      = csvdecode(file("${path.module}/application_profiles.csv"))
    epg_list                     = csvdecode(file("${path.module}/epgs.csv"))
    epg_to_static_path_list      = csvdecode(file("${path.module}/epgs_to_static_paths.csv"))
    epg_to_domain_list           = csvdecode(file("${path.module}/epgs_to_domains.csv"))
    contract_list                = csvdecode(file("${path.module}/contracts.csv"))
    epg_to_contract_list         = csvdecode(file("${path.module}/epgs_to_contracts.csv"))
    contract_subject_list        = csvdecode(file("${path.module}/contract_subjects.csv"))
    filter_list                  = csvdecode(file("${path.module}/filters.csv"))
    filter_entry_list            = csvdecode(file("${path.module}/filter_entries.csv"))

    filter_reference_list        = csvdecode(file("${path.module}/filter_references.csv"))
    tenant_reference_list        = csvdecode(file("${path.module}/tenant_references.csv"))
    bridge_domain_reference_list = csvdecode(file("${path.module}/bridge_domain_references.csv"))

    physical_domain              = data.aci_physical_domain.BareMetal.id
}

