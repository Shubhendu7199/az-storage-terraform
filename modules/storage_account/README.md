## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.storage_accounts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_share.file_shares](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_share) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_storage_accounts"></a> [storage\_accounts](#input\_storage\_accounts) | n/a | <pre>map(object({<br>    name                     = string<br>    resource_group_name      = string<br>    location                 = string<br>    account_tier             = optional(string)<br>    access_tier              = optional(string)<br>    nfsv3_enabled            = optional(bool)<br>    is_hns_enabled           = optional(bool)<br>    large_file_share_enabled = optional(bool)<br>    account_replication_type = optional(string)<br>    account_kind             = optional(string)<br>    network_rules = optional(object({<br>      default_action               = string<br>      bypass                       = optional(list(string))<br>      ip_rules                     = optional(list(string))<br>      virtual_network_subnet_names = optional(list(string))<br>    }))<br>    file_shares = optional(list(object({<br>      name             = string<br>      quota            = number<br>      access_tier      = optional(string)<br>      enabled_protocol = optional(string)<br>    })))<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
