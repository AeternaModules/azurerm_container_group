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
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.image_registry_credential == null || alltrue([for item in v.image_registry_credential : (length(item.server) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.image_registry_credential == null || alltrue([for item in v.image_registry_credential : (item.username == null || (length(item.username) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.image_registry_credential == null || alltrue([for item in v.image_registry_credential : (item.password == null || (length(item.password) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.zones == null || (alltrue([for x in v.zones : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.init_container == null || alltrue([for item in v.init_container : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.init_container == null || alltrue([for item in v.init_container : (length(item.image) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.init_container == null || alltrue([for item in v.init_container : (item.commands == null || (alltrue([for x in item.commands : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.init_container == null || alltrue([for item in v.init_container : (item.volume == null || alltrue([for item in item.volume : (length(item.name) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.init_container == null || alltrue([for item in v.init_container : (item.volume == null || alltrue([for item in item.volume : (length(item.mount_path) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.init_container == null || alltrue([for item in v.init_container : (item.volume == null || alltrue([for item in item.volume : (item.share_name == null || (length(item.share_name) > 0))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.init_container == null || alltrue([for item in v.init_container : (item.volume == null || alltrue([for item in item.volume : (item.storage_account_name == null || (length(item.storage_account_name) > 0))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.init_container == null || alltrue([for item in v.init_container : (item.volume == null || alltrue([for item in item.volume : (item.storage_account_key == null || (length(item.storage_account_key) > 0))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        alltrue([for item in v.container : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        alltrue([for item in v.container : (length(item.image) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        alltrue([for item in v.container : (item.cpu_limit == null || (item.cpu_limit >= 0.0))])
      )
    ])
    error_message = "must be at least 0.0"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        alltrue([for item in v.container : (item.memory_limit == null || (item.memory_limit >= 0.0))])
      )
    ])
    error_message = "must be at least 0.0"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        alltrue([for item in v.container : (item.commands == null || (alltrue([for x in item.commands : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        alltrue([for item in v.container : (item.volume == null || alltrue([for item in item.volume : (length(item.name) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        alltrue([for item in v.container : (item.volume == null || alltrue([for item in item.volume : (length(item.mount_path) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        alltrue([for item in v.container : (item.volume == null || alltrue([for item in item.volume : (item.share_name == null || (length(item.share_name) > 0))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        alltrue([for item in v.container : (item.volume == null || alltrue([for item in item.volume : (item.storage_account_name == null || (length(item.storage_account_name) > 0))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        alltrue([for item in v.container : (item.volume == null || alltrue([for item in item.volume : (item.storage_account_key == null || (length(item.storage_account_key) > 0))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        alltrue([for item in v.container : (item.liveness_probe == null || (item.liveness_probe.http_get == null || alltrue([for item in item.liveness_probe.http_get : (item.path == null || (length(item.path) > 0))])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        alltrue([for item in v.container : (item.readiness_probe == null || (item.readiness_probe.http_get == null || alltrue([for item in item.readiness_probe.http_get : (item.path == null || (length(item.path) > 0))])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.diagnostics == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.diagnostics.log_analytics.workspace_id)))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.diagnostics == null || (length(v.diagnostics.log_analytics.workspace_key) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.dns_config == null || (v.dns_config.search_domains == null || (alltrue([for x in v.dns_config.search_domains : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_groups : (
        v.dns_config == null || (v.dns_config.options == null || (alltrue([for x in v.dns_config.options : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 33 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

