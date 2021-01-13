resource "aci_filter" "filter" {
    for_each                        = { for ft in var.filter_list : ft.ft_id => ft }
    tenant_dn                       = data.aci_tenant.tenant_references[each.value.tn_id].id
    name                            = each.value.ft_name
    annotation                      = each.value.ft_annotation
    name_alias                      = each.value.ft_name_alias
    relation_vz_rs_filt_graph_att   = each.value.ft_relation_vz_rs_filt_graph_att
    relation_vz_rs_fwd_r_flt_p_att  = each.value.ft_relation_vz_rs_fwd_r_flt_p_att
    relation_vz_rs_rev_r_flt_p_att  = each.value.ft_relation_vz_rs_rev_r_flt_p_att
}
