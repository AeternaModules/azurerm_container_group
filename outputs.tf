output "container_groups_id" {
  description = "Map of id values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.id }
}
output "container_groups_container" {
  description = "Map of container values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.container }
  sensitive   = true
}
output "container_groups_diagnostics" {
  description = "Map of diagnostics values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.diagnostics }
  sensitive   = true
}
output "container_groups_dns_config" {
  description = "Map of dns_config values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.dns_config }
}
output "container_groups_dns_name_label" {
  description = "Map of dns_name_label values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.dns_name_label }
}
output "container_groups_dns_name_label_reuse_policy" {
  description = "Map of dns_name_label_reuse_policy values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.dns_name_label_reuse_policy }
}
output "container_groups_exposed_port" {
  description = "Map of exposed_port values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.exposed_port }
}
output "container_groups_fqdn" {
  description = "Map of fqdn values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.fqdn }
}
output "container_groups_identity" {
  description = "Map of identity values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.identity }
}
output "container_groups_image_registry_credential" {
  description = "Map of image_registry_credential values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.image_registry_credential }
  sensitive   = true
}
output "container_groups_init_container" {
  description = "Map of init_container values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.init_container }
  sensitive   = true
}
output "container_groups_ip_address" {
  description = "Map of ip_address values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.ip_address }
}
output "container_groups_ip_address_type" {
  description = "Map of ip_address_type values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.ip_address_type }
}
output "container_groups_key_vault_key_id" {
  description = "Map of key_vault_key_id values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.key_vault_key_id }
}
output "container_groups_key_vault_user_assigned_identity_id" {
  description = "Map of key_vault_user_assigned_identity_id values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.key_vault_user_assigned_identity_id }
}
output "container_groups_location" {
  description = "Map of location values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.location }
}
output "container_groups_name" {
  description = "Map of name values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.name }
}
output "container_groups_network_profile_id" {
  description = "Map of network_profile_id values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.network_profile_id }
}
output "container_groups_os_type" {
  description = "Map of os_type values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.os_type }
}
output "container_groups_priority" {
  description = "Map of priority values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.priority }
}
output "container_groups_resource_group_name" {
  description = "Map of resource_group_name values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.resource_group_name }
}
output "container_groups_restart_policy" {
  description = "Map of restart_policy values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.restart_policy }
}
output "container_groups_sku" {
  description = "Map of sku values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.sku }
}
output "container_groups_subnet_ids" {
  description = "Map of subnet_ids values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.subnet_ids }
}
output "container_groups_tags" {
  description = "Map of tags values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.tags }
}
output "container_groups_zones" {
  description = "Map of zones values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.zones }
}

