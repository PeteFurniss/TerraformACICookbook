resource "aci_epg_to_static_path" "epg_to_static_path" {
    for_each                    = { for es in var.epg_to_static_path_list : es.es_id => es }
    application_epg_dn          = "${aci_application_epg.application_epg[each.value.ae_id].id}"
    tdn                         = "topology/pod-${each.value.es_pod_id}/paths-${each.value.es_logical_pair_id}/pathep-[${each.value.es_port_name}]"
    annotation                  = each.value.es_annotation
    encap                       = each.value.es_encap
    instr_imedcy                = each.value.es_instr_imedcy
    mode                        = each.value.es_mode
    primary_encap               = each.value.es_primary_encap
}
