resource "aci_contract" "Contract" {
    for_each                               = { for con in var.contract_list : con.con_id => con }
    tenant_dn                              = var.tenant
    name                                   = each.value.con_name
    annotation                             = each.value.con_annotation
    name_alias                             = each.value.con_name_alias
    prio                                   = each.value.con_prio
    scope                                  = each.value.con_scope
    target_dscp                            = each.value.con_target_dscp
    relation_vz_rs_graph_att               = each.value.con_relation_vz_rs_graph_att
#    filter                                 = each.value.con_filter
#    filter.filter_name                     = each.value.con_filter_name
#    filter.description                     = each.value.con_filter_description
#    filter.annotation                      = each.value.con_filter_annotation
#    filter.name_alias                      = each.value.con_filter_name_alias
#    filter.filter_entry                    = each.value.con_filter_entry
#    filter.filter_entry.filter_entry_name  = each.value.con_filter_entry_name
#    filter.filter_entry.entry_annotation   = each.value.con_filter_entry_annotation
#    filter.filter_entry.entry_description  = each.value.con_filter_entry_description
#    filter.filter_entry.apply_to_frag      = each.value.con_filter_entry_apply_to_frag
#    filter.filter_entry.arp_opc            = each.value.con_filter_entry_arp_opc
#    filter.filter_entry.d_from_port        = each.value.con_filter_entry_d_from_port
#    filter.filter_entry.d_to_port          = each.value.con_filter_entry_d_to_port
#    filter.filter_entry.ether_t            = each.value.con_filter_entry_ether_t
#    filter.filter_entry.icmpv4_t           = each.value.con_filter_entry_icmpv4_t
#    filter.filter_entry.icmpv6_t           = each.value.con_filter_entry_icmpv6_t
#    filter.filter_entry.match_dscp         = each.value.con_filter_entry_match_dscp
#    filter.filter_entry.entry_name_alias   = each.value.con_filter_entry_name_alias
#    filter.filter_entry.prot               = each.value.con_filter_entry_prot
#    filter.filter_entry.s_from_port        = each.value.con_filter_entry_s_from_port
#    filter.filter_entry.s_to_port          = each.value.con_filter_entry_s_to_port
#    filter.filter_entry.stateful           = each.value.con_filter_entry_stateful
#    filter.filter_entry.tcp_rules          = each.value.con_filter_entry_tcp_rules
}

