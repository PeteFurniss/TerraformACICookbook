resource "aci_filter_entry" "filter_entry" {
    for_each                               = { for fe in var.filter_entry_list : fe.fe_id => fe }
    filter_dn                              = "${aci_filter.filter[each.value.ft_id].id}"
    name                                   = each.value.fe_name
    annotation                             = each.value.fe_annotation
    apply_to_frag                          = each.value.fe_apply_to_frag
    arp_opc                                = each.value.fe_arp_opc
    d_from_port                            = each.value.fe_d_from_port
    d_to_port                              = each.value.fe_d_to_port
    ether_t                                = each.value.fe_ether_t
    icmpv4_t                               = each.value.fe_icmpv4_t
    icmpv6_t                               = each.value.fe_icmpv6_t
    match_dscp                             = each.value.fe_match_dscp
    name_alias                             = each.value.fe_name_alias
    prot                                   = each.value.fe_prot
    s_from_port                            = each.value.fe_s_from_port
    s_to_port                              = each.value.fe_s_to_port
    stateful                               = each.value.fe_stateful
    tcp_rules                              = each.value.fe_tcp_rules
}

