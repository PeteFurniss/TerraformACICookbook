resource "aci_application_profile" "App_Profile" {
    for_each                  = { for ap in var.application_profile_list : ap.ap_id => ap }
    tenant_dn                 = data.aci_tenant.Tenant_References[each.value.tenant_id].id
    name                      = each.value.ap_name
    annotation                = each.value.ap_annotation
    name_alias                = each.value.ap_name_alias
    prio                      = each.value.ap_prio
    relation_fv_rs_ap_mon_pol = each.value.ap_relation_fv_rs_ap_mon_pol
}
