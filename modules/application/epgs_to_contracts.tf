resource "aci_epg_to_contract" "EPG_to_Contract" {
    for_each                    = { for e2c in var.epg_to_contract_list : e2c.e2c_id => e2c }
    application_epg_dn          = "${aci_application_epg.App_EPG[each.value.epg_id].id}"
    contract_dn                 = "${aci_contract.Contract[each.value.con_id].id}"
    contract_type               = each.value.e2c_contract_type
    annotation                  = each.value.e2c_annotation
    match_t                     = each.value.e2c_match_t
    prio                        = each.value.e2c_prio
}
