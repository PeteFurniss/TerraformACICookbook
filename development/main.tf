provider "aci" {
    username    = "admin"
    password    = "ciscopsdt"
    url         = "https://sandboxapicdc.cisco.com"
    insecure    = true
}

module "fabric" {
    source = "../modules/fabric"

    leaf_pair_list = ["103-104", "105-106"]
    leaf_port_list = ["1-1", "1-2", "1-3", "1-4", "1-5", "1-6", "1-7", "1-8", "1-9"]
}
