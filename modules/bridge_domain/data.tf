data "aci_tenant" "tenant_references" {
    for_each                       = { for tn_reference in var.tenant_reference_list : tn_reference.tn_id => tn_reference }
    name                           = each.value.tn_name
}

