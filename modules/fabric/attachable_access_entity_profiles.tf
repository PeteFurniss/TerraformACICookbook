resource "aci_attachable_access_entity_profile" "PNF_AAEP" {
    name                    = "PNF_AAEP"
    relation_infra_rs_dom_p = [aci_physical_domain.physical_domain.id]
}
