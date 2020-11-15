#variable "leaf_pair_list" {
#    description = "A list of the leaf pairs for all the leaf switches. Each entry in the list takes the form <1st leaf of pair>-<2nd leaf of pair>"
#    type        = list(string)
#}

variable "leaf_pair_map" {
    description = "A map of the leaf pairs for all the leaf switches. Each entry in the map takes the form: <key>:<leaf_pair_name> where <leaf_pair_name> is <1st leaf of pair>-<2nd leaf of pair>"
    type        = list(map(string))
}

#variable "leaf_port_list" {
#    description = "A list of the card/port combinations for a single leaf switch. Each entry in the lst takes the form '<card number>-<port number>'"
#    type        = list(string)
#}

variable "leaf_port_map" {
    description = "A list of leaf_port_maps, one entry for each leaf/port combination."
    type        = list(map(string))
}
