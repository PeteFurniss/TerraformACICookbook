resource "aci_contract" "contract" {
    for_each                               = { for cn in var.contract_list : cn.cn_id => cn }
    tenant_dn                              = data.aci_tenant.tenant_references[each.value.tn_id].id
    name                                   = each.value.cn_name
    annotation                             = each.value.cn_annotation
    name_alias                             = each.value.cn_name_alias
    prio                                   = each.value.cn_prio
    scope                                  = each.value.cn_scope
    target_dscp                            = each.value.cn_target_dscp
    relation_vz_rs_graph_att               = each.value.cn_relation_vz_rs_graph_att
}

