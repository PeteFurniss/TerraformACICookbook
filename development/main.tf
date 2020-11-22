provider "aci" {
    username    = "admin"
    password    = "ciscopsdt"
    url         = "https://sandboxapicdc.cisco.com"
    insecure    = true
}

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

    ap_list    = csvdecode(file("${path.module}/application_profiles.csv"))
    epg_list   = csvdecode(file("${path.module}/epgs.csv"))

    tenant     = data.aci_tenant.PNF_Tenant.id
    physical_domain = data.aci_physical_domain.BareMetal.id
}

