output "container_groups" {
  description = "All container_group resources"
  value       = azurerm_container_group.container_groups
  sensitive   = true
}
output "container_groups_container" {
  description = "List of container values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.container]
  sensitive   = true
}
output "container_groups_diagnostics" {
  description = "List of diagnostics values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.diagnostics]
  sensitive   = true
}
output "container_groups_dns_config" {
  description = "List of dns_config values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.dns_config]
}
output "container_groups_dns_name_label" {
  description = "List of dns_name_label values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.dns_name_label]
}
output "container_groups_dns_name_label_reuse_policy" {
  description = "List of dns_name_label_reuse_policy values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.dns_name_label_reuse_policy]
}
output "container_groups_exposed_port" {
  description = "List of exposed_port values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.exposed_port]
}
output "container_groups_fqdn" {
  description = "List of fqdn values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.fqdn]
}
output "container_groups_identity" {
  description = "List of identity values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.identity]
}
output "container_groups_image_registry_credential" {
  description = "List of image_registry_credential values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.image_registry_credential]
  sensitive   = true
}
output "container_groups_init_container" {
  description = "List of init_container values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.init_container]
  sensitive   = true
}
output "container_groups_ip_address" {
  description = "List of ip_address values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.ip_address]
}
output "container_groups_ip_address_type" {
  description = "List of ip_address_type values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.ip_address_type]
}
output "container_groups_key_vault_key_id" {
  description = "List of key_vault_key_id values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.key_vault_key_id]
}
output "container_groups_key_vault_user_assigned_identity_id" {
  description = "List of key_vault_user_assigned_identity_id values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.key_vault_user_assigned_identity_id]
}
output "container_groups_location" {
  description = "List of location values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.location]
}
output "container_groups_name" {
  description = "List of name values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.name]
}
output "container_groups_network_profile_id" {
  description = "List of network_profile_id values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.network_profile_id]
}
output "container_groups_os_type" {
  description = "List of os_type values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.os_type]
}
output "container_groups_priority" {
  description = "List of priority values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.priority]
}
output "container_groups_resource_group_name" {
  description = "List of resource_group_name values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.resource_group_name]
}
output "container_groups_restart_policy" {
  description = "List of restart_policy values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.restart_policy]
}
output "container_groups_sku" {
  description = "List of sku values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.sku]
}
output "container_groups_subnet_ids" {
  description = "List of subnet_ids values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.subnet_ids]
}
output "container_groups_tags" {
  description = "List of tags values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.tags]
}
output "container_groups_zones" {
  description = "List of zones values across all container_groups"
  value       = [for k, v in azurerm_container_group.container_groups : v.zones]
}

