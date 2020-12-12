resource "aci_filter" "Filter" {
    for_each                        = { for filt in var.filter_list : filt.filt_id => filt }
    tenant_dn                       = var.tenant
    name                            = each.value.filt_name
    annotation                      = each.value.filt_annotation
    name_alias                      = each.value.filt_name_alias
    relation_vz_rs_filt_graph_att   = each.value.filt_relation_vz_rs_filt_graph_att
    relation_vz_rs_fwd_r_flt_p_att  = each.value.filt_relation_vz_rs_fwd_r_flt_p_att
    relation_vz_rs_rev_r_flt_p_att  = each.value.filt_relation_vz_rs_rev_r_flt_p_att
}
