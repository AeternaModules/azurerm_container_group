variable "container_groups" {
  description = <<EOT
Map of container_groups, attributes below
Required:
    - location
    - name
    - os_type
    - resource_group_name
    - container (block):
        - commands (optional)
        - cpu (required)
        - cpu_limit (optional)
        - environment_variables (optional)
        - image (required)
        - liveness_probe (optional, block):
            - exec (optional)
            - failure_threshold (optional)
            - http_get (optional, block):
                - http_headers (optional)
                - path (optional)
                - port (optional)
                - scheme (optional)
            - initial_delay_seconds (optional)
            - period_seconds (optional)
            - success_threshold (optional)
            - timeout_seconds (optional)
        - memory (required)
        - memory_limit (optional)
        - name (required)
        - ports (optional, block):
            - port (optional)
            - protocol (optional)
        - readiness_probe (optional, block):
            - exec (optional)
            - failure_threshold (optional)
            - http_get (optional, block):
                - http_headers (optional)
                - path (optional)
                - port (optional)
                - scheme (optional)
            - initial_delay_seconds (optional)
            - period_seconds (optional)
            - success_threshold (optional)
            - timeout_seconds (optional)
        - secure_environment_variables (optional)
        - security (optional, block):
            - privilege_enabled (required)
        - volume (optional, block):
            - empty_dir (optional)
            - git_repo (optional, block):
                - directory (optional)
                - revision (optional)
                - url (required)
            - mount_path (required)
            - name (required)
            - read_only (optional)
            - secret (optional)
            - share_name (optional)
            - storage_account_key (optional)
            - storage_account_name (optional)
Optional:
    - dns_name_label
    - dns_name_label_reuse_policy
    - ip_address_type
    - key_vault_key_id
    - key_vault_user_assigned_identity_id
    - network_profile_id
    - priority
    - restart_policy
    - sku
    - subnet_ids
    - tags
    - zones
    - diagnostics (block):
        - log_analytics (required, block):
            - log_type (optional)
            - metadata (optional)
            - workspace_id (required)
            - workspace_key (required)
    - dns_config (block):
        - nameservers (required)
        - options (optional)
        - search_domains (optional)
    - exposed_port (block):
        - port (optional)
        - protocol (optional)
    - identity (block):
        - identity_ids (optional)
        - type (required)
    - image_registry_credential (block):
        - password (optional)
        - server (required)
        - user_assigned_identity_id (optional)
        - username (optional)
    - init_container (block):
        - commands (optional)
        - environment_variables (optional)
        - image (required)
        - name (required)
        - secure_environment_variables (optional)
        - security (optional, block):
            - privilege_enabled (required)
        - volume (optional, block):
            - empty_dir (optional)
            - git_repo (optional, block):
                - directory (optional)
                - revision (optional)
                - url (required)
            - mount_path (required)
            - name (required)
            - read_only (optional)
            - secret (optional)
            - share_name (optional)
            - storage_account_key (optional)
            - storage_account_name (optional)
EOT

  type = map(object({
    location                            = string
    name                                = string
    os_type                             = string
    resource_group_name                 = string
    dns_name_label                      = optional(string)
    dns_name_label_reuse_policy         = optional(string)
    ip_address_type                     = optional(string)
    key_vault_key_id                    = optional(string)
    key_vault_user_assigned_identity_id = optional(string)
    network_profile_id                  = optional(string)
    priority                            = optional(string)
    restart_policy                      = optional(string)
    sku                                 = optional(string)
    subnet_ids                          = optional(set(string))
    tags                                = optional(map(string))
    zones                               = optional(set(string))
    container = list(object({
      commands              = optional(list(string))
      cpu                   = number
      cpu_limit             = optional(number)
      environment_variables = optional(map(string))
      image                 = string
      liveness_probe = optional(object({
        exec              = optional(list(string))
        failure_threshold = optional(number)
        http_get = optional(list(object({
          http_headers = optional(map(string))
          path         = optional(string)
          port         = optional(number)
          scheme       = optional(string)
        })))
        initial_delay_seconds = optional(number)
        period_seconds        = optional(number)
        success_threshold     = optional(number)
        timeout_seconds       = optional(number)
      }))
      memory       = number
      memory_limit = optional(number)
      name         = string
      ports = optional(list(object({
        port     = optional(number)
        protocol = optional(string)
      })))
      readiness_probe = optional(object({
        exec              = optional(list(string))
        failure_threshold = optional(number)
        http_get = optional(list(object({
          http_headers = optional(map(string))
          path         = optional(string)
          port         = optional(number)
          scheme       = optional(string)
        })))
        initial_delay_seconds = optional(number)
        period_seconds        = optional(number)
        success_threshold     = optional(number)
        timeout_seconds       = optional(number)
      }))
      secure_environment_variables = optional(map(string))
      security = optional(list(object({
        privilege_enabled = bool
      })))
      volume = optional(list(object({
        empty_dir = optional(bool)
        git_repo = optional(object({
          directory = optional(string)
          revision  = optional(string)
          url       = string
        }))
        mount_path           = string
        name                 = string
        read_only            = optional(bool)
        secret               = optional(map(string))
        share_name           = optional(string)
        storage_account_key  = optional(string)
        storage_account_name = optional(string)
      })))
    }))
    diagnostics = optional(object({
      log_analytics = object({
        log_type      = optional(string)
        metadata      = optional(map(string))
        workspace_id  = string
        workspace_key = string
      })
    }))
    dns_config = optional(object({
      nameservers    = list(string)
      options        = optional(set(string))
      search_domains = optional(set(string))
    }))
    exposed_port = optional(list(object({
      port     = optional(number)
      protocol = optional(string)
    })))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
    image_registry_credential = optional(list(object({
      password                  = optional(string)
      server                    = string
      user_assigned_identity_id = optional(string)
      username                  = optional(string)
    })))
    init_container = optional(list(object({
      commands                     = optional(list(string))
      environment_variables        = optional(map(string))
      image                        = string
      name                         = string
      secure_environment_variables = optional(map(string))
      security = optional(list(object({
        privilege_enabled = bool
      })))
      volume = optional(list(object({
        empty_dir = optional(bool)
        git_repo = optional(object({
          directory = optional(string)
          revision  = optional(string)
          url       = string
        }))
        mount_path           = string
        name                 = string
        read_only            = optional(bool)
        secret               = optional(map(string))
        share_name           = optional(string)
        storage_account_key  = optional(string)
        storage_account_name = optional(string)
      })))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        length(v.container) >= 1
      )
    ])
    error_message = "Each container list must contain at least 1 items"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_container_group's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: ip_address_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: os_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: image_registry_credential.server
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: image_registry_credential.user_assigned_identity_id
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: image_registry_credential.user_assigned_identity_id
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: image_registry_credential.username
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: image_registry_credential.password
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: subnet_ids[*]
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: subnet_ids[*]
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: zones[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
  # path: sku
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: restart_policy
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: dns_name_label_reuse_policy
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: exposed_port.port
  #   source:    validate.PortNumber: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: exposed_port.protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: init_container.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: init_container.image
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: init_container.commands[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: init_container.volume.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: init_container.volume.mount_path
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: init_container.volume.share_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: init_container.volume.storage_account_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: init_container.volume.storage_account_key
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: container.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: container.image
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: container.cpu_limit
  #   source:    validation.FloatAtLeast(...) - no translation rule yet, add one
  # path: container.memory_limit
  #   source:    validation.FloatAtLeast(...) - no translation rule yet, add one
  # path: container.ports.port
  #   source:    validate.PortNumber: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: container.ports.protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: container.commands[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: container.volume.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: container.volume.mount_path
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: container.volume.share_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: container.volume.storage_account_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: container.volume.storage_account_key
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: container.liveness_probe.exec[*]
  #   source:    validation.NoZeroValues(...) - no translation rule yet, add one
  # path: container.liveness_probe.http_get.path
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: container.liveness_probe.http_get.port
  #   source:    validate.PortNumber: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: container.liveness_probe.http_get.scheme
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: container.readiness_probe.exec[*]
  #   source:    validation.NoZeroValues(...) - no translation rule yet, add one
  # path: container.readiness_probe.http_get.path
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: container.readiness_probe.http_get.port
  #   source:    validate.PortNumber: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: container.readiness_probe.http_get.scheme
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: diagnostics.log_analytics.workspace_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: diagnostics.log_analytics.workspace_key
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: diagnostics.log_analytics.log_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: dns_config.search_domains[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: dns_config.options[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: key_vault_key_id
  #   source:    [from keyvault.ValidateNestedItemID] !ok
  # path: key_vault_key_id
  #   source:    [from keyvault.ValidateNestedItemID] err != nil
  # path: key_vault_user_assigned_identity_id
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: key_vault_user_assigned_identity_id
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: priority
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
}

