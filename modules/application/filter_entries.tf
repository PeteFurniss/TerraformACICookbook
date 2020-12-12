resource "aci_filter_entry" "Filter_Entry" {
    for_each                               = { for filtent in var.filter_entry_list : filtent.filtent_id => filtent }
    filter_dn                              = "${aci_filter.Filter[each.value.filt_id].id}"
    name                                   = each.value.filtent_name
    annotation                             = each.value.filtent_annotation
    apply_to_frag                          = each.value.filtent_apply_to_frag
    arp_opc                                = each.value.filtent_arp_opc
    d_from_port                            = each.value.filtent_d_from_port
    d_to_port                              = each.value.filtent_d_to_port
    ether_t                                = each.value.filtent_ether_t
    icmpv4_t                               = each.value.filtent_icmpv4_t
    icmpv6_t                               = each.value.filtent_icmpv6_t
    match_dscp                             = each.value.filtent_match_dscp
    name_alias                             = each.value.filtent_name_alias
    prot                                   = each.value.filtent_prot
    s_from_port                            = each.value.filtent_s_from_port
    s_to_port                              = each.value.filtent_s_to_port
    stateful                               = each.value.filtent_stateful
    tcp_rules                              = each.value.filtent_tcp_rules
}

