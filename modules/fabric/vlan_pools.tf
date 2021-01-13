resource "aci_vlan_pool" "Physical_VLANs" {
    name       = "Physical_VLANs"
    alloc_mode = "static"
}

resource "aci_ranges" "Physical_VLANs_Range" {
    vlan_pool_dn = "${aci_vlan_pool.Physical_VLANs.id}"
    _from        = "vlan-3000"
    to           = "vlan-3999"
    alloc_mode   = "inherit"
    role         = "internal"
}

resource "aci_physical_domain" "physical_domain" {
    name = "EXAMPLE_PHYSICAL_DOMAIN01"
    relation_infra_rs_vlan_ns = "${aci_vlan_pool.Physical_VLANs.id}"
}

resource "aci_vlan_pool" "VMM_VLANs" {
    name       = "VMM_VLANs"
    alloc_mode = "static"
}

resource "aci_ranges" "VMM_VLANs_Range" {
    vlan_pool_dn = "${aci_vlan_pool.VMM_VLANs.id}"
    _from        = "vlan-2000"
    to           = "vlan-2999"
    alloc_mode   = "inherit"
    role         = "internal"
}

resource "aci_vmm_domain" "vmm_domain" {
    provider_profile_dn       = "uni/vmmp-VMware"
    name                      = "EXAMPLE_VIRTUAL_DOMAIN01"
    relation_infra_rs_vlan_ns = "${aci_vlan_pool.VMM_VLANs.id}"
}
