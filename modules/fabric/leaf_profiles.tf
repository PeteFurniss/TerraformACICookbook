resource "aci_leaf_profile" "Leaf_Pair_Profile" {
    for_each                     = { for leaf_pair in var.leaf_pair_map : leaf_pair.leaf_pair_id => leaf_pair }
    name                         = "Leaf${split("-", each.value.leaf_pair_name)[0]}-${split("-", each.value.leaf_pair_name)[1]}_Profile"
    description                  = "PF Leaf ${split("-", each.value.leaf_pair_name)[0]} ${split("-", each.value.leaf_pair_name)[1]} Pair Profile"
    relation_infra_rs_acc_port_p = [aci_leaf_interface_profile.Leaf_Pair_IF_Profile[each.key].id]
}

resource "aci_leaf_selector" "Leaf_Pair_Profile_Selector" {
    for_each                = { for leaf_pair in var.leaf_pair_map : leaf_pair.leaf_pair_id => leaf_pair }
    leaf_profile_dn         = "${aci_leaf_profile.Leaf_Pair_Profile[each.key].id}"
    name                    = "Leaf${split("-", each.value.leaf_pair_name)[0]}-${split("-", each.value.leaf_pair_name)[1]}_Profile_Selector"
    switch_association_type = "range"
}

resource "aci_node_block" "Leaf_Pair_Names" {
    for_each                = { for leaf_pair in var.leaf_pair_map : leaf_pair.leaf_pair_id => leaf_pair }
    switch_association_dn   = "${aci_leaf_selector.Leaf_Pair_Profile_Selector[each.key].id}"
    name                    = "Leaf_Pair${split("-", each.value.leaf_pair_name)[0]}-${split("-", each.value.leaf_pair_name)[1]}"
    from_                   = "${split("-", each.value.leaf_pair_name)[0]}"
    to_                     = "${split("-", each.value.leaf_pair_name)[1]}"
}

resource "aci_vpc_explicit_protection_group" "VPC_Explicit_Protection_Group" {
    for_each                = { for leaf_pair in var.leaf_pair_map : leaf_pair.leaf_pair_id => leaf_pair }
    name                    = "VPC_Protection_Group_Leaf_Pair${split("-", each.value.leaf_pair_name)[0]}-${split("-", each.value.leaf_pair_name)[1]}"
    switch1                 = "${split("-", each.value.leaf_pair_name)[0]}"
    switch2                 = "${split("-", each.value.leaf_pair_name)[1]}"
    vpc_explicit_protection_group_id = tostring(tonumber("${split("-", each.value.leaf_pair_name)[0]}")+100)
}
