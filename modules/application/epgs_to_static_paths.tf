resource "aci_epg_to_static_path" "EPG_to_Static_Path" {
    for_each                    = { for e2sp in var.epg_to_static_path_list : e2sp.e2sp_id => e2sp }
    application_epg_dn          = "${aci_application_epg.App_EPG[each.value.epg_id].id}"
    tdn                         = "topology/pod-${each.value.e2sp_pod_id}/paths-${each.value.e2sp_logical_pair_id}/pathep-[${each.value.e2sp_port_id}]"
    annotation                  = each.value.e2sp_annotation
    encap                       = each.value.e2sp_encap
    instr_imedcy                = each.value.e2sp_instr_imedcy
    mode                        = each.value.e2sp_mode
    primary_encap               = each.value.e2sp_primary_encap
}
