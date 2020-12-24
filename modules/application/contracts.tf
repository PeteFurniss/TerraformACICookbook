resource "aci_contract" "Contract" {
    for_each                               = { for con in var.contract_list : con.con_id => con }
    tenant_dn                              = data.aci_tenant.Tenant_References[each.value.tenant_id].id
    name                                   = each.value.con_name
    annotation                             = each.value.con_annotation
    name_alias                             = each.value.con_name_alias
    prio                                   = each.value.con_prio
    scope                                  = each.value.con_scope
    target_dscp                            = each.value.con_target_dscp
    relation_vz_rs_graph_att               = each.value.con_relation_vz_rs_graph_att
}

