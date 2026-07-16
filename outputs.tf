output "container_groups_id" {
  description = "Map of id values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.id if v.id != null && length(v.id) > 0 }
}
output "container_groups_container" {
  description = "Map of container values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.container if v.container != null && length(v.container) > 0 }
  sensitive   = true
}
output "container_groups_diagnostics" {
  description = "Map of diagnostics values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.diagnostics if v.diagnostics != null && length(v.diagnostics) > 0 }
  sensitive   = true
}
output "container_groups_dns_config" {
  description = "Map of dns_config values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.dns_config if v.dns_config != null && length(v.dns_config) > 0 }
}
output "container_groups_dns_name_label" {
  description = "Map of dns_name_label values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.dns_name_label if v.dns_name_label != null && length(v.dns_name_label) > 0 }
}
output "container_groups_dns_name_label_reuse_policy" {
  description = "Map of dns_name_label_reuse_policy values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.dns_name_label_reuse_policy if v.dns_name_label_reuse_policy != null && length(v.dns_name_label_reuse_policy) > 0 }
}
output "container_groups_exposed_port" {
  description = "Map of exposed_port values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.exposed_port if v.exposed_port != null && length(v.exposed_port) > 0 }
}
output "container_groups_fqdn" {
  description = "Map of fqdn values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.fqdn if v.fqdn != null && length(v.fqdn) > 0 }
}
output "container_groups_identity" {
  description = "Map of identity values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.identity if v.identity != null && length(v.identity) > 0 }
}
output "container_groups_image_registry_credential" {
  description = "Map of image_registry_credential values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.image_registry_credential if v.image_registry_credential != null && length(v.image_registry_credential) > 0 }
  sensitive   = true
}
output "container_groups_init_container" {
  description = "Map of init_container values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.init_container if v.init_container != null && length(v.init_container) > 0 }
  sensitive   = true
}
output "container_groups_ip_address" {
  description = "Map of ip_address values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.ip_address if v.ip_address != null && length(v.ip_address) > 0 }
}
output "container_groups_ip_address_type" {
  description = "Map of ip_address_type values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.ip_address_type if v.ip_address_type != null && length(v.ip_address_type) > 0 }
}
output "container_groups_key_vault_key_id" {
  description = "Map of key_vault_key_id values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.key_vault_key_id if v.key_vault_key_id != null && length(v.key_vault_key_id) > 0 }
}
output "container_groups_key_vault_user_assigned_identity_id" {
  description = "Map of key_vault_user_assigned_identity_id values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.key_vault_user_assigned_identity_id if v.key_vault_user_assigned_identity_id != null && length(v.key_vault_user_assigned_identity_id) > 0 }
}
output "container_groups_location" {
  description = "Map of location values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.location if v.location != null && length(v.location) > 0 }
}
output "container_groups_name" {
  description = "Map of name values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.name if v.name != null && length(v.name) > 0 }
}
output "container_groups_network_profile_id" {
  description = "Map of network_profile_id values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.network_profile_id if v.network_profile_id != null && length(v.network_profile_id) > 0 }
}
output "container_groups_os_type" {
  description = "Map of os_type values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.os_type if v.os_type != null && length(v.os_type) > 0 }
}
output "container_groups_priority" {
  description = "Map of priority values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.priority if v.priority != null && length(v.priority) > 0 }
}
output "container_groups_resource_group_name" {
  description = "Map of resource_group_name values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "container_groups_restart_policy" {
  description = "Map of restart_policy values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.restart_policy if v.restart_policy != null && length(v.restart_policy) > 0 }
}
output "container_groups_sku" {
  description = "Map of sku values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.sku if v.sku != null && length(v.sku) > 0 }
}
output "container_groups_subnet_ids" {
  description = "Map of subnet_ids values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.subnet_ids if v.subnet_ids != null && length(v.subnet_ids) > 0 }
}
output "container_groups_tags" {
  description = "Map of tags values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "container_groups_zones" {
  description = "Map of zones values across all container_groups, keyed the same as var.container_groups"
  value       = { for k, v in azurerm_container_group.container_groups : k => v.zones if v.zones != null && length(v.zones) > 0 }
}

