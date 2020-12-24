data "aci_tenant" "Tenant_References" {
    for_each                       = { for tenant_reference in var.tenant_reference_list : tenant_reference.tenant_id => tenant_reference }
    name                           = each.value.tenant_name
}

data "aci_bridge_domain" "BD_References" {
    for_each                       = { for bd_reference in var.bridge_domain_reference_list : bd_reference.bd_id => bd_reference }
    tenant_dn                      = data.aci_tenant.Tenant_References[each.value.tenant_id].id
    name                           = each.value.bd_name
}