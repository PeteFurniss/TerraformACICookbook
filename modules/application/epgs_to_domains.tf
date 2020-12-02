resource "aci_epg_to_domain" "EPG_to_Domain" {
    for_each                    = { for e2d in var.epg_to_domain_list : e2d.e2d_id => e2d }
    application_epg_dn          = "${aci_application_epg.App_EPG[each.value.epg_id].id}"
    tdn                         = var.physical_domain
    annotation                  = each.value.e2d_annotation
    binding_type                = each.value.e2d_binding_type
    allow_micro_seg             = each.value.e2d_allow_micro_seg
    delimiter                   = each.value.e2d_delimiter
    encap                       = each.value.e2d_encap
    encap_mode                  = each.value.e2d_encap_mode
    epg_cos                     = each.value.e2d_epg_cos
    epg_cos_pref                = each.value.e2d_epg_cos_pref
    instr_imedcy                = each.value.e2d_instr_imedcy
    lag_policy_name             = each.value.e2d_lag_policy_name
    netflow_dir                 = each.value.e2d_netflow_dir
    netflow_pref                = each.value.e2d_netflow_pref
    num_ports                   = each.value.e2d_num_ports
    port_allocation             = each.value.e2d_port_allocation
    primary_encap               = each.value.e2d_primary_encap
    primary_encap_inner         = each.value.e2d_primary_encap_inner
    res_imedcy                  = each.value.e2d_res_imedcy
    secondary_encap_inner       = each.value.e2d_secondary_encap_inner
    switching_mode              = each.value.e2d_switching_mode
    vmm_allow_promiscuous       = each.value.e2d_vmm_allow_promiscuous
    vmm_forged_transmits        = each.value.e2d_vmm_forged_transmits
    vmm_mac_changes             = each.value.e2d_vmm_mac_changes
}
