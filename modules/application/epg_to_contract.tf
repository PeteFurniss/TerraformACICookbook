resource "aci_epg_to_contract" "epg_to_contract" {
    for_each                    = { for ec in var.epg_to_contract_list : ec.ec_id => ec }
    application_epg_dn          = "${aci_application_epg.application_epg[each.value.ae_id].id}"
    contract_dn                 = data.aci_contract.contract_references[each.value.cn_id].id
    contract_type               = each.value.ec_contract_type
    annotation                  = each.value.ec_annotation
    match_t                     = each.value.ec_match_t
    prio                        = each.value.ec_prio
}
