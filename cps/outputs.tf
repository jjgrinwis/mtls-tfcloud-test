output "hostnames" {
  description = "mtls hostnames"
  value       = data.tfe_workspace_ids.properties.ids
}
