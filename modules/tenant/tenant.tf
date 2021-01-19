resource "aci_tenant" "tenant" {
    for_each                      = { for tn in var.tenant_list : tn.tn_id => tn }
    name                          = each.value.tn_name
    annotation                    = each.value.tn_annotation
    name_alias                    = each.value.tn_name_alias
    relation_fv_rs_tn_deny_rule   = toset(split("|", each.value.tn_relation_fv_rs_tn_deny_rule))
    relation_fv_rs_tenant_mon_pol = each.value.tn_relation_fv_rs_tenant_mon_pol
}
