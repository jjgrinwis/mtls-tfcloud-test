// get all workspaces based on tags
// when running 'remote', we need to set TFE token in provider config or ENV var
// https://registry.terraform.io/providers/hashicorp/tfe/latest/docs#authentication
data "tfe_workspace_ids" "properties" {
  tag_names    = ["mtls"]
  organization = var.organization
}

data "tfe_outputs" "all" {
  for_each     = data.tfe_workspace_ids.properties.ids
  organization = var.organization
  workspace    = each.key
}

locals {
  // hostnames var is a list of hostnames we're going to use in our SAN list of our certificate.
  hostnames = {

    // flatten the list so we get just one list.
    // we're converting a list to a set.
    value = toset(flatten([
      // first loop over the output of set of workspaces
      for item in data.tfe_outputs.all : [
        // for each workspace, get the value of the specific output field (map)
        // if key doesn't exists in the map, make it null
        // only add item to our list if it's not null
        lookup(item.nonsensitive_values, "created_hostnames", null)
      ] if lookup(item.nonsensitive_values, "created_hostnames", null) != null
    ]))
  }
}
