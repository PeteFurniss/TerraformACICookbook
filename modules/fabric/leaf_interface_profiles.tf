resource "aci_leaf_interface_profile" "Leaf_Pair_IF_Profile" {
    for_each    = { for leaf_pair in var.leaf_pair_map : leaf_pair.leaf_pair_id => leaf_pair }
    name        = "Leaf${split("-", each.value.leaf_pair_name)[0]}-${split("-", each.value.leaf_pair_name)[1]}_IF_Profile"
}

resource "aci_access_port_selector" "Leaf_Pair_Port_Selector" {
    for_each    = { for leaf_port in var.leaf_port_map : leaf_port.leaf_port_id => leaf_port }
#    for_each                   = {for item in setproduct(var.leaf_pair_list, var.leaf_port_list):
#                                  "${item[0]}-${item[1]}" => {
#                                       leaf_pair = item[0]
#                                       card_port = item[1]
#                                     }
#                                 }
    leaf_interface_profile_dn  = "${aci_leaf_interface_profile.Leaf_Pair_IF_Profile[each.value.leaf_pair_id].id}"
    name                       = "Leaf${each.value.leaf_pair_name}_Port${each.value.port_id}_Selector"
    access_port_selector_type  = "range"
#    relation_infra_rs_acc_base_grp = "${aci_leaf_access_port_policy_group.lacp_active_leaf_access_port_policy_group.id}"
}

resource "aci_access_port_block" "Leaf_Pair_Port_Block" {
    for_each    = { for leaf_port in var.leaf_port_map : leaf_port.leaf_port_id => leaf_port }
#    for_each                   = {for item in setproduct(var.leaf_pair_list, var.leaf_port_list):
#                                  "${item[0]}-${item[1]}" => {
#                                       leaf_pair = item[0]
#                                       card_port = item[1]
#                                     }
#                                 }
    access_port_selector_dn    = "${aci_access_port_selector.Leaf_Pair_Port_Selector[each.key].id}"
    name                       = "Leaf${each.value.leaf_pair_name}_Port${each.value.port_id}"
    from_card                  = "${split("-", each.value.port_id)[0]}"
    from_port                  = "${split("-", each.value.port_id)[1]}"
    to_card                    = "${split("-", each.value.port_id)[0]}"
    to_port                    = "${split("-", each.value.port_id)[1]}"
}
