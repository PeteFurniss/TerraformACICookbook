resource "aci_leaf_interface_profile" "Leaf_Pair_IF_Profile" {
    for_each    = toset(var.leaf_pair_list)
    name        = "Leaf${split("-", each.value)[0]}-${split("-", each.value)[1]}_IF_Profile"
}

resource "aci_access_port_selector" "Leaf_Pair_Port_Selector" {
    for_each                   = {for item in setproduct(var.leaf_pair_list, var.leaf_port_list):
                                  "${item[0]}-${item[1]}" => {
                                       leaf_pair = item[0]
                                       card_port = item[1]
                                     }
                                 }
    leaf_interface_profile_dn  = "${aci_leaf_interface_profile.Leaf_Pair_IF_Profile[each.value.leaf_pair].id}"
    name                       = "Leaf${each.value.leaf_pair}_Port${each.value.card_port}_Selector"
    access_port_selector_type  = "range"
    relation_infra_rs_acc_base_grp = "${aci_pcvpc_interface_policy_group.lacp_active_vpc_interface_policy_group.id}"
}

resource "aci_access_port_block" "Leaf_Pair_Port_Block" {
    for_each                   = {for item in setproduct(var.leaf_pair_list, var.leaf_port_list):
                                  "${item[0]}-${item[1]}" => {
                                       leaf_pair = item[0]
                                       card_port = item[1]
                                     }
                                 }
    access_port_selector_dn    = "${aci_access_port_selector.Leaf_Pair_Port_Selector[each.key].id}"
    name                       = "Leaf${each.value.leaf_pair}_Port${each.value.card_port}"
    from_card                  = "${split("-", each.value.card_port)[0]}"
    from_port                  = "${split("-", each.value.card_port)[1]}"
    to_card                    = "${split("-", each.value.card_port)[0]}"
    to_port                    = "${split("-", each.value.card_port)[1]}"
}
