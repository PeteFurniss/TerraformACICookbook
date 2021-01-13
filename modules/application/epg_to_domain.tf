resource "aci_epg_to_domain" "epg_to_domain" {
    for_each                    = { for ed in var.epg_to_domain_list : ed.ed_id => ed }
    application_epg_dn          = "${aci_application_epg.application_epg[each.value.ae_id].id}"
    tdn                         = each.value.ed_domain_type == "PHYSICAL" ? data.aci_physical_domain.physical_domain_references[each.value.do_id].id : ( each.value.ed_domain_type == "VIRTUAL"  ? data.aci_vmm_domain.vmm_domain_references[each.value.do_id].id : "" )
    annotation                  = each.value.ed_annotation
    binding_type                = each.value.ed_binding_type
    allow_micro_seg             = each.value.ed_allow_micro_seg
    delimiter                   = each.value.ed_delimiter
    encap                       = each.value.ed_encap
    encap_mode                  = each.value.ed_encap_mode
    epg_cos                     = each.value.ed_epg_cos
    epg_cos_pref                = each.value.ed_epg_cos_pref
    instr_imedcy                = each.value.ed_instr_imedcy
    lag_policy_name             = each.value.ed_lag_policy_name
    netflow_dir                 = each.value.ed_netflow_dir
    netflow_pref                = each.value.ed_netflow_pref
    num_ports                   = each.value.ed_num_ports
    port_allocation             = each.value.ed_port_allocation
    primary_encap               = each.value.ed_primary_encap
    primary_encap_inner         = each.value.ed_primary_encap_inner
    res_imedcy                  = each.value.ed_res_imedcy
    secondary_encap_inner       = each.value.ed_secondary_encap_inner
    switching_mode              = each.value.ed_switching_mode
    vmm_allow_promiscuous       = each.value.ed_vmm_allow_promiscuous
    vmm_forged_transmits        = each.value.ed_vmm_forged_transmits
    vmm_mac_changes             = each.value.ed_vmm_mac_changes
}
