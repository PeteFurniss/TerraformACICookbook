resource "aci_contract_subject" "contract_subject" {
    for_each                       = { for cs in var.contract_subject_list : cs.cs_id => cs }
    contract_dn                    = "${aci_contract.contract[each.value.cn_id].id}"
    name                           = each.value.cs_name
    annotation                     = each.value.cs_annotation
    cons_match_t                   = each.value.cs_cons_match_t
    name_alias                     = each.value.cs_name_alias
    prio                           = each.value.cs_prio
    prov_match_t                   = each.value.cs_prov_match_t
    rev_flt_ports                  = each.value.cs_rev_flt_ports
    target_dscp                    = each.value.cs_target_dscp
    relation_vz_rs_subj_graph_att  = each.value.cs_relation_vz_rs_subj_graph_att
    relation_vz_rs_sdwan_pol       = each.value.cs_relation_vz_rs_sdwan_pol
    relation_vz_rs_subj_filt_att   = toset([for ft_id in split("|", each.value.cs_relation_vz_rs_subj_filt_att) : data.aci_filter.filter_references[ft_id].id])
}
