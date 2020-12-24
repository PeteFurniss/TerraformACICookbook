resource "aci_bridge_domain" "PNF_BD" {
    tenant_dn = "${aci_tenant.PNF_Tenant.id}"
    name = "PNF_Bridge_Domain"
}
