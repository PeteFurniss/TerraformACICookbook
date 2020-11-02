resource "aci_application_epg" "PNF_EPG_Web" {
    name = "PNF_EPG_Web"
    application_profile_dn = "${aci_application_profile.PNF_App1.id}"
}

resource "aci_epg_to_domain" "PNF_EPG_Web_to_Baremetal" {
    application_epg_dn = "${aci_application_epg.PNF_EPG_Web.id}"
    tdn                = var.physical_domain
}

resource "aci_epg_to_static_path" "PNF_EPG_Web_to_Leaf_103-104_Eth1_9" {
    application_epg_dn = "${aci_application_epg.PNF_EPG_Web.id}"
    tdn                = "topology/pod-1/paths-203/pathep-[eth1/9]"
    encap              = "vlan-3000"
}
