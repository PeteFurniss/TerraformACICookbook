resource "aci_application_profile" "PNF_App1" {
    name = "PNF_App1"
    tenant_dn = "${aci_tenant.PNF_Tenant.id}"
}
