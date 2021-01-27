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

module "fabric" {
    source = "../../modules/fabric"

    leaf_pair_map  = csvdecode(file("${path.module}/leaf_pairs.csv"))
    leaf_port_map  = csvdecode(file("${path.module}/leaf_ports.csv"))
}

module "tenant" {
    source = "../../modules/tenant"
    depends_on = [module.fabric]

    tenant_list                    = csvdecode(file("${path.module}/tenant.csv"))
}

module "bridge_domain" {
    source = "../../modules/bridge_domain"
    depends_on = [module.tenant]

    bridge_domain_list             = csvdecode(file("${path.module}/bridge_domain.csv"))

    tenant_reference_list          = csvdecode(file("${path.module}/tenant_references.csv"))
}

module "filter" {
    source     = "../../modules/filter"
    depends_on = [module.tenant]

    filter_list                    = csvdecode(file("${path.module}/filter.csv"))
    filter_entry_list              = csvdecode(file("${path.module}/filter_entry.csv"))

    tenant_reference_list          = csvdecode(file("${path.module}/tenant_references.csv"))
}

module "contract" {
    source     = "../../modules/contract"
    depends_on = [module.tenant, module.filter]

    contract_list                  = csvdecode(file("${path.module}/contract.csv"))
    contract_subject_list          = csvdecode(file("${path.module}/contract_subject.csv"))

    tenant_reference_list          = csvdecode(file("${path.module}/tenant_references.csv"))
    filter_reference_list          = csvdecode(file("${path.module}/filter_references.csv"))
}

module "application" {
    source     = "../../modules/application"
    depends_on = [module.tenant, module.bridge_domain, module.contract]

    application_profile_list       = csvdecode(file("${path.module}/application_profile.csv"))
    application_epg_list           = csvdecode(file("${path.module}/application_epg.csv"))
    epg_to_static_path_list        = csvdecode(file("${path.module}/epg_to_static_path.csv"))
    epg_to_domain_list             = csvdecode(file("${path.module}/epg_to_domain.csv"))
    epg_to_contract_list           = csvdecode(file("${path.module}/epg_to_contract.csv"))

    physical_domain_reference_list = csvdecode(file("${path.module}/physical_domain_references.csv"))
    vmm_domain_reference_list      = csvdecode(file("${path.module}/vmm_domain_references.csv"))
    tenant_reference_list          = csvdecode(file("${path.module}/tenant_references.csv"))
    contract_reference_list        = csvdecode(file("${path.module}/contract_references.csv"))
    bridge_domain_reference_list   = csvdecode(file("${path.module}/bridge_domain_references.csv"))
}

