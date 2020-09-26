resource "aci_vlan_pool" "BareMetal_VLANs" {
    name       = "BareMetal_VLANs"
    alloc_mode = "static"
}

resource "aci_ranges" "BareMetal_VLANs_Range" {
    vlan_pool_dn = "${aci_vlan_pool.BareMetal_VLANs.id}"
    _from        = "vlan-3000"
    to           = "vlan-3999"
    alloc_mode   = "inherit"
    role         = "internal"
}

resource "aci_physical_domain" "BareMetal" {
    name = "BareMetal"
    relation_infra_rs_vlan_ns = "${aci_vlan_pool.BareMetal_VLANs.id}"
}
