resource "aci_application_profile" "App_Profile" {
    for_each                  = { for ap in var.ap_list : ap.ap_id => ap }
    tenant_dn                 = var.tenant
    name                      = each.value.ap_name
    annotation                = each.value.ap_annotation
    name_alias                = each.value.ap_name_alias
    prio                      = each.value.ap_prio
    relation_fv_rs_ap_mon_pol = each.value.ap_relation_fv_rs_ap_mon_pol
}
