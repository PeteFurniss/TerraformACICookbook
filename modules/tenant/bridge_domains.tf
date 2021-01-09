resource "aci_bridge_domain" "bridge_domain" {
    tenant_dn = "${aci_tenant.tenant.id}"
    name = "EXAMPLE_BRIDGE_DOMAIN01"
}
