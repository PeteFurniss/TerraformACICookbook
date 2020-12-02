resource "aci_lldp_interface_policy" "lldp_on_interface_policy" {
    description = "Switches LLDP on for both receive and transmit on an interface"
    name        = "lldp_on_interface_policy"
    admin_rx_st = "enabled"
    admin_tx_st = "enabled"
}

resource "aci_cdp_interface_policy" "cdp_off_interface_policy" {
    description = "Switches cdp off on an interface"
    name        = "cdp_off_interface_policy"
    admin_st    = "disabled"
}

resource "aci_lacp_policy" "lacp_active_port_channel_policy" {
    description = "Switches an interface to LACP Active mode"
    name        = "lacp_active_port_channel_policy"
# Following line commented-out due to bug #126 in Terraform 0.13.4/ACI
    ctrl        = ["fast-sel-hot-stdby","graceful-conv","susp-individual"]
#    ctrl        = "fast-sel-hot-stdby"
    mode        = "active"
}
