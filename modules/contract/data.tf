data "aci_tenant" "tenant_references" {
    for_each                       = { for tn_reference in var.tenant_reference_list : tn_reference.tn_id => tn_reference }
    name                           = each.value.tn_name
}

data "aci_filter" "filter_references" {
    for_each                       = { for ft_reference in var.filter_reference_list : ft_reference.ft_id => ft_reference }
    tenant_dn                      = data.aci_tenant.tenant_references[each.value.tn_id].id
    name                           = each.value.ft_name
}

