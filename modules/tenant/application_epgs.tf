resource "aci_application_epg" "PNF_EPG_Web" {
    name = "PNF_EPG_Web"
    application_profile_dn = "${aci_application_profile.PNF_App1.id}"
}

resource "aci_epg_to_domain" "PNF_EPG_Web_to_Baremetal" {
    application_epg_dn = "${aci_application_epg.PNF_EPG_Web.id}"
    tdn                = var.physical_domain
}
