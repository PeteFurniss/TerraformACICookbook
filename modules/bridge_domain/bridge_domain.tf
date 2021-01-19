resource "aci_bridge_domain" "bridge_domain" {
    for_each                                 = { for bd in var.bridge_domain_list : bd.bd_id => bd }
    tenant_dn                                = data.aci_tenant.tenant_references[each.value.tn_id].id
    name                                     = each.value.bd_name
    optimize_wan_bandwidth                   = each.value.bd_optimize_wan_bandwidth
    annotation                               = each.value.bd_annotation
    arp_flood                                = each.value.bd_arp_flood
    ep_clear                                 = each.value.bd_ep_clear
    ep_move_detect_mode                      = each.value.bd_ep_move_detect_mode
    host_based_routing                       = each.value.bd_host_based_routing
    intersite_bum_traffic_allow              = each.value.bd_intersite_bum_traffic_allow
    intersite_l2_stretch                     = each.value.bd_intersite_l2_stretch
    ip_learning                              = each.value.bd_ip_learning
    ipv6_mcast_allow                         = each.value.bd_ipv6_mcast_allow
    limit_ip_learn_to_subnets                = each.value.bd_limit_ip_learn_to_subnets
    ll_addr                                  = each.value.bd_ll_addr
    mac                                      = each.value.bd_mac
    mcast_allow                              = each.value.bd_mcast_allow
    multi_dst_pkt_act                        = each.value.bd_multi_dst_pkt_act
    name_alias                               = each.value.bd_name_alias
    bridge_domain_type                       = each.value.bd_bridge_domain_type
    unicast_route                            = each.value.bd_unicast_route
    unk_mac_ucast_act                        = each.value.bd_unk_mac_ucast_act
    unk_mcast_act                            = each.value.bd_unk_mcast_act
    v6unk_mcast_act                          = each.value.bd_v6unk_mcast_act
    vmac                                     = each.value.bd_vmac
    relation_fv_rs_bd_to_profile             = each.value.bd_relation_fv_rs_bd_to_profile
    relation_fv_rs_mldsn                     = each.value.bd_relation_fv_rs_mldsn
    relation_fv_rs_abd_pol_mon_pol           = each.value.bd_relation_fv_rs_abd_pol_mon_pol
    relation_fv_rs_bd_to_nd_p                = each.value.bd_relation_fv_rs_bd_to_nd_p
    relation_fv_rs_bd_flood_to               = toset(split("|", each.value.bd_relation_fv_rs_bd_flood_to))
    relation_fv_rs_bd_to_fhs                 = each.value.bd_relation_fv_rs_bd_to_fhs
    relation_fv_rs_bd_to_relay_p             = each.value.bd_relation_fv_rs_bd_to_relay_p
    relation_fv_rs_ctx                       = each.value.bd_relation_fv_rs_ctx
    relation_fv_rs_igmpsn                    = each.value.bd_relation_fv_rs_igmpsn
    relation_fv_rs_bd_to_ep_ret              = each.value.bd_relation_fv_rs_bd_to_ep_ret
    relation_fv_rs_bd_to_out                 = toset(split("|", each.value.bd_relation_fv_rs_bd_to_out))
}
