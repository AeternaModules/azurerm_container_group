resource "azurerm_container_group" "container_groups" {
  for_each = var.container_groups

  location                            = each.value.location
  name                                = each.value.name
  os_type                             = each.value.os_type
  resource_group_name                 = each.value.resource_group_name
  dns_name_label                      = each.value.dns_name_label
  dns_name_label_reuse_policy         = each.value.dns_name_label_reuse_policy
  ip_address_type                     = each.value.ip_address_type
  key_vault_key_id                    = each.value.key_vault_key_id
  key_vault_user_assigned_identity_id = each.value.key_vault_user_assigned_identity_id
  network_profile_id                  = each.value.network_profile_id
  priority                            = each.value.priority
  restart_policy                      = each.value.restart_policy
  sku                                 = each.value.sku
  subnet_ids                          = each.value.subnet_ids
  tags                                = each.value.tags
  zones                               = each.value.zones

  container {
    commands              = each.value.container.commands
    cpu                   = each.value.container.cpu
    cpu_limit             = each.value.container.cpu_limit
    environment_variables = each.value.container.environment_variables
    image                 = each.value.container.image
    dynamic "liveness_probe" {
      for_each = each.value.container.liveness_probe != null ? [each.value.container.liveness_probe] : []
      content {
        exec              = liveness_probe.value.exec
        failure_threshold = liveness_probe.value.failure_threshold
        dynamic "http_get" {
          for_each = liveness_probe.value.http_get != null ? [liveness_probe.value.http_get] : []
          content {
            http_headers = http_get.value.http_headers
            path         = http_get.value.path
            port         = http_get.value.port
            scheme       = http_get.value.scheme
          }
        }
        initial_delay_seconds = liveness_probe.value.initial_delay_seconds
        period_seconds        = liveness_probe.value.period_seconds
        success_threshold     = liveness_probe.value.success_threshold
        timeout_seconds       = liveness_probe.value.timeout_seconds
      }
    }
    memory       = each.value.container.memory
    memory_limit = each.value.container.memory_limit
    name         = each.value.container.name
    dynamic "ports" {
      for_each = each.value.container.ports != null ? [each.value.container.ports] : []
      content {
        port     = ports.value.port
        protocol = ports.value.protocol
      }
    }
    dynamic "readiness_probe" {
      for_each = each.value.container.readiness_probe != null ? [each.value.container.readiness_probe] : []
      content {
        exec              = readiness_probe.value.exec
        failure_threshold = readiness_probe.value.failure_threshold
        dynamic "http_get" {
          for_each = readiness_probe.value.http_get != null ? [readiness_probe.value.http_get] : []
          content {
            http_headers = http_get.value.http_headers
            path         = http_get.value.path
            port         = http_get.value.port
            scheme       = http_get.value.scheme
          }
        }
        initial_delay_seconds = readiness_probe.value.initial_delay_seconds
        period_seconds        = readiness_probe.value.period_seconds
        success_threshold     = readiness_probe.value.success_threshold
        timeout_seconds       = readiness_probe.value.timeout_seconds
      }
    }
    secure_environment_variables = each.value.container.secure_environment_variables
    dynamic "security" {
      for_each = each.value.container.security != null ? [each.value.container.security] : []
      content {
        privilege_enabled = security.value.privilege_enabled
      }
    }
    dynamic "volume" {
      for_each = each.value.container.volume != null ? [each.value.container.volume] : []
      content {
        empty_dir = volume.value.empty_dir
        dynamic "git_repo" {
          for_each = volume.value.git_repo != null ? [volume.value.git_repo] : []
          content {
            directory = git_repo.value.directory
            revision  = git_repo.value.revision
            url       = git_repo.value.url
          }
        }
        mount_path           = volume.value.mount_path
        name                 = volume.value.name
        read_only            = volume.value.read_only
        secret               = volume.value.secret
        share_name           = volume.value.share_name
        storage_account_key  = volume.value.storage_account_key
        storage_account_name = volume.value.storage_account_name
      }
    }
  }

  dynamic "diagnostics" {
    for_each = each.value.diagnostics != null ? [each.value.diagnostics] : []
    content {
      log_analytics {
        log_type      = diagnostics.value.log_analytics.log_type
        metadata      = diagnostics.value.log_analytics.metadata
        workspace_id  = diagnostics.value.log_analytics.workspace_id
        workspace_key = diagnostics.value.log_analytics.workspace_key
      }
    }
  }

  dynamic "dns_config" {
    for_each = each.value.dns_config != null ? [each.value.dns_config] : []
    content {
      nameservers    = dns_config.value.nameservers
      options        = dns_config.value.options
      search_domains = dns_config.value.search_domains
    }
  }

  dynamic "exposed_port" {
    for_each = each.value.exposed_port != null ? [each.value.exposed_port] : []
    content {
      port     = exposed_port.value.port
      protocol = exposed_port.value.protocol
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "image_registry_credential" {
    for_each = each.value.image_registry_credential != null ? [each.value.image_registry_credential] : []
    content {
      password                  = image_registry_credential.value.password
      server                    = image_registry_credential.value.server
      user_assigned_identity_id = image_registry_credential.value.user_assigned_identity_id
      username                  = image_registry_credential.value.username
    }
  }

  dynamic "init_container" {
    for_each = each.value.init_container != null ? [each.value.init_container] : []
    content {
      commands                     = init_container.value.commands
      environment_variables        = init_container.value.environment_variables
      image                        = init_container.value.image
      name                         = init_container.value.name
      secure_environment_variables = init_container.value.secure_environment_variables
      dynamic "security" {
        for_each = init_container.value.security != null ? [init_container.value.security] : []
        content {
          privilege_enabled = security.value.privilege_enabled
        }
      }
      dynamic "volume" {
        for_each = init_container.value.volume != null ? [init_container.value.volume] : []
        content {
          empty_dir = volume.value.empty_dir
          dynamic "git_repo" {
            for_each = volume.value.git_repo != null ? [volume.value.git_repo] : []
            content {
              directory = git_repo.value.directory
              revision  = git_repo.value.revision
              url       = git_repo.value.url
            }
          }
          mount_path           = volume.value.mount_path
          name                 = volume.value.name
          read_only            = volume.value.read_only
          secret               = volume.value.secret
          share_name           = volume.value.share_name
          storage_account_key  = volume.value.storage_account_key
          storage_account_name = volume.value.storage_account_name
        }
      }
    }
  }
}

