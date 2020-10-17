resource "aci_leaf_access_port_policy_group" "lacp_active_leaf_access_port_policy_group" {
    description                   = "VPC policy group for LACP Active, LLDP Enabled, CDP Disabled"
    name                          = "lacp_active_leaf_access_port_policy_group"
#    lag_t                         = "node"     # Sets the policy group to a VPC
    relation_infra_rs_lldp_if_pol = "${aci_lldp_interface_policy.lldp_on_interface_policy.id}"
    relation_infra_rs_cdp_if_pol  = "${aci_cdp_interface_policy.cdp_off_interface_policy.id}"
#    relation_infra_rs_lacp_pol    = "${aci_lacp_policy.lacp_active_port_channel_policy.id}"
    relation_infra_rs_att_ent_p   = "${aci_attachable_access_entity_profile.PNF_AAEP.id}"
}
