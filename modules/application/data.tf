data "aci_physical_domain" "physical_domain_references" {
    for_each                       = { for pd_reference in var.physical_domain_reference_list : pd_reference.pd_id => pd_reference }
    name                           = each.value.pd_name
}

data "aci_vmm_domain" "vmm_domain_references" {
    for_each                       = { for vd_reference in var.vmm_domain_reference_list : vd_reference.vd_id => vd_reference }
    provider_profile_dn            = each.value.vd_provider_profile_dn
    name                           = each.value.vd_name
}

data "aci_tenant" "tenant_references" {
    for_each                       = { for tn_reference in var.tenant_reference_list : tn_reference.tn_id => tn_reference }
    name                           = each.value.tn_name
}

data "aci_bridge_domain" "bridge_domain_references" {
    for_each                       = { for bd_reference in var.bridge_domain_reference_list : bd_reference.bd_id => bd_reference }
    tenant_dn                      = data.aci_tenant.tenant_references[each.value.tn_id].id
    name                           = each.value.bd_name
}


data "aci_contract" "contract_references" {
    for_each                       = { for cn_reference in var.contract_reference_list : cn_reference.cn_id => cn_reference }
    tenant_dn                      = data.aci_tenant.tenant_references[each.value.tn_id].id
    name                           = each.value.cn_name
}

