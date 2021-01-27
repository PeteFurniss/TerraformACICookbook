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

module "tenant" {
    source = "../../modules/tenant"

    tenant_list                    = csvdecode(file("${path.module}/tenant.csv"))
}
