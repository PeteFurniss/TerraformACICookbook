resource "aci_contract_subject" "Contract_Subject" {
    for_each                       = { for consub in var.contract_subject_list : consub.consub_id => consub }
    contract_dn                    = "${aci_contract.Contract[each.value.con_id].id}"
    name                           = each.value.consub_name
    annotation                     = each.value.consub_annotation
    cons_match_t                   = each.value.consub_cons_match_t
    name_alias                     = each.value.consub_name_alias
    prio                           = each.value.consub_prio
    prov_match_t                   = each.value.consub_prov_match_t
    rev_flt_ports                  = each.value.consub_rev_flt_ports
    target_dscp                    = each.value.consub_target_dscp
    relation_vz_rs_subj_graph_att  = each.value.consub_relation_vz_rs_subj_graph_att
    relation_vz_rs_sdwan_pol       = each.value.consub_relation_vz_rs_sdwan_pol
    relation_vz_rs_subj_filt_att   = toset([each.value.consub_relation_vz_rs_subj_filt_att])
}
