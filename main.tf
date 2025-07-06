locals {
  ebuisness_folder_id = "folders/400349323251"  
}

resource "google_folder" "teams" {
  for_each = toset([
    "hub",
    "ops",
    "search",
    "ordermanagement",
    "businessintelligence",
    "supplymanagement",
    "productcreation",
    "integration",
    "omnichannel",
    "consumerapp",
    "customerselfservice",
    "productpresentation",
    "productinformation",
    "dropshipment"
  ])

  display_name = each.key
  parent       = local.ebuisness_folder_id
}
