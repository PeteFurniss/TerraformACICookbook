resource "aci_application_epg" "application_epg" {
    for_each                    = { for ae in var.application_epg_list : ae.ae_id => ae }
    application_profile_dn      = "${aci_application_profile.application_profile[each.value.ap_id].id}"
    name                        = each.value.ae_name
    annotation                  = each.value.ae_annotation
    exception_tag               = each.value.ae_exception_tag
    flood_on_encap              = each.value.ae_flood_on_encap
    fwd_ctrl                    = each.value.ae_fwd_ctrl
    has_mcast_source            = each.value.ae_has_mcast_source
    is_attr_based_epg           = each.value.ae_is_attr_based_epg
    match_t                     = each.value.ae_match_t
    name_alias                  = each.value.ae_name_alias
    pc_enf_pref                 = each.value.ae_pc_enf_pref
    pref_gr_memb                = each.value.ae_pref_gr_memb
    prio                        = each.value.ae_prio
    shutdown                    = each.value.ae_shutdown
    relation_fv_rs_bd           = data.aci_bridge_domain.bridge_domain_references[each.value.bd_id].id
    relation_fv_rs_cust_qos_pol = each.value.ae_relation_fv_rs_cust_qos_pol
    relation_fv_rs_fc_path_att  = toset(split("|", each.value.ae_relation_fv_rs_fc_path_att))
    relation_fv_rs_prov         = toset(split("|", each.value.ae_relation_fv_rs_prov))
    relation_fv_rs_graph_def    = toset(split("|", each.value.ae_relation_fv_rs_graph_def))
    relation_fv_rs_cons_if      = toset(split("|", each.value.ae_relation_fv_rs_cons_if))
    relation_fv_rs_sec_inherited= toset(split("|", each.value.ae_relation_fv_rs_sec_inherited))
    relation_fv_rs_node_att     = toset(split("|", each.value.ae_relation_fv_rs_node_att))
    relation_fv_rs_dpp_pol      = each.value.ae_relation_fv_rs_dpp_pol
    relation_fv_rs_cons         = toset(split("|", each.value.ae_relation_fv_rs_cons))
    relation_fv_rs_prov_def     = toset(split("|", each.value.ae_relation_fv_rs_prov_def))
    relation_fv_rs_trust_ctrl   = each.value.ae_relation_fv_rs_trust_ctrl
    relation_fv_rs_prot_by      = toset(split("|", each.value.ae_relation_fv_rs_prot_by))
    relation_fv_rs_aepg_mon_pol = each.value.ae_relation_fv_rs_aepg_mon_pol
    relation_fv_rs_intra_epg    = toset(split("|", each.value.ae_relation_fv_rs_intra_epg))
}
