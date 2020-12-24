resource "aci_application_epg" "App_EPG" {
    for_each                    = { for epg in var.epg_list : epg.epg_id => epg }
    application_profile_dn      = "${aci_application_profile.App_Profile[each.value.ap_id].id}"
    name                        = each.value.epg_name
    annotation                  = each.value.epg_annotation
    exception_tag               = each.value.epg_exception_tag
    flood_on_encap              = each.value.epg_flood_on_encap
    fwd_ctrl                    = each.value.epg_fwd_ctrl
    has_mcast_source            = each.value.epg_has_mcast_source
    is_attr_based_epg           = each.value.epg_is_attr_based_epg
    match_t                     = each.value.epg_match_t
    name_alias                  = each.value.epg_name_alias
    pc_enf_pref                 = each.value.epg_pc_enf_pref
    pref_gr_memb                = each.value.epg_pref_gr_memb
    prio                        = each.value.epg_prio
    shutdown                    = each.value.epg_shutdown
    relation_fv_rs_bd           = data.aci_bridge_domain.BD_References[each.value.bd_id].id
    relation_fv_rs_cust_qos_pol = each.value.epg_relation_fv_rs_cust_qos_pol
    relation_fv_rs_fc_path_att  = toset(split("|", each.value.epg_relation_fv_rs_fc_path_att))
    relation_fv_rs_prov         = toset(split("|", each.value.epg_relation_fv_rs_prov))
    relation_fv_rs_graph_def    = toset(split("|", each.value.epg_relation_fv_rs_graph_def))
    relation_fv_rs_cons_if      = toset(split("|", each.value.epg_relation_fv_rs_cons_if))
    relation_fv_rs_sec_inherited= toset(split("|", each.value.epg_relation_fv_rs_sec_inherited))
    relation_fv_rs_node_att     = toset(split("|", each.value.epg_relation_fv_rs_node_att))
    relation_fv_rs_dpp_pol      = each.value.epg_relation_fv_rs_dpp_pol
    relation_fv_rs_cons         = toset(split("|", each.value.epg_relation_fv_rs_cons))
    relation_fv_rs_prov_def     = toset(split("|", each.value.epg_relation_fv_rs_prov_def))
    relation_fv_rs_trust_ctrl   = each.value.epg_relation_fv_rs_trust_ctrl
    relation_fv_rs_prot_by      = toset(split("|", each.value.epg_relation_fv_rs_prot_by))
    relation_fv_rs_aepg_mon_pol = each.value.epg_relation_fv_rs_aepg_mon_pol
    relation_fv_rs_intra_epg    = toset(split("|", each.value.epg_relation_fv_rs_intra_epg))
}
