# Terraform Storage Account Module

This Terraform module creates Azure Storage Accounts along with associated resources. It provides flexibility to define various configurations for the storage accounts.

## Table of Contents

- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)

## Usage

```hcl
module "sa" {
  source           = "./modules/storage_account_new"
  storage_accounts = var.storage_accounts
}
```
## Module Inputs

### `storage_accounts` (required)

A map of storage account configurations. Each key is a unique name for the storage account, and the value is a map of properties for that storage account.

Example:

```hcl
storage_accounts = {
  sa1 = {
    name                     = "shubh0name"
    resource_group_name      = "rg-sa-test"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    file_shares = [
      { name = "shubhendu", quota = 100, access_tier = "TransactionOptimized" },
    ]
  }
  sa2 = {
    name                     = "shubh20name"
    resource_group_name      = "rg-sa-test"
    location                 = "uksouth"
    account_tier             = "Premium"
    account_replication_type = "LRS"
    account_kind             = "FileStorage"
    file_shares = [
      { name = "shubhendu", quota = 100, access_tier = "Premium", enabled_protocol = "NFS" },
    ]
  }
  sa3 = {
    name                     = "shubh89name"
    resource_group_name      = "rg-sa-test"
    location                 = "uksouth"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    network_rules = {
      default_action               = "Deny"
      virtual_network_subnet_names = ["shub_id/rg1/vnet1/subnet1", "rg2/vnet2/subnet2"]
    }
  }
}
```

## Variable Structure

### `storage_accounts`

A map of storage account configurations. Each key is a unique name for the storage account, and the value is a map of properties for that storage account.

#### Properties:

- `name` (string, required): The name of the storage account.
- `resource_group_name` (string, required): The name of the resource group where the storage account will be created.
- `location` (string, required): The Azure region where the storage account will be located.
- `account_tier` (string, optional): The storage account tier. Default is `"Standard"`.
- `access_tier` (string, optional): The access tier for the storage account. Default is `"Hot"`.
- `nfsv3_enabled` (bool, optional): Specifies whether NFSv3 is enabled on the storage account. Default is `false`.
- `is_hns_enabled` (bool, optional): Specifies whether Hierarchical Namespace (HNS) is enabled on the storage account. Default is `false`.
- `large_file_share_enabled` (bool, optional): Specifies whether large file shares are enabled on the storage account. Default is `false`.
- `account_replication_type` (string, optional): The replication type for the storage account. Default is `"LRS"`.
- `account_kind` (string, optional): The kind of storage account. Default is `"StorageV2"`.
- `network_rules` (object, optional): Network rules for the storage account.

  ###### Properties:

  - `default_action` (string, required): The default action for network rules.
  - `bypass` (list of strings, optional): Specifies the bypass rules for traffic.
  - `ip_rules` (list of strings, optional): Specifies the IP rules for traffic.
  - `virtual_network_subnet_names` (list of strings, optional): Specifies the virtual network subnet names.

- `file_shares` (list of objects, optional): List of file shares to be created within the storage account.

  ###### Object Properties:

  - `name` (string, required): The name of the file share.
  - `quota` (string, required): The quota for the file share.
  - `access_tier` (string, optional): The access tier for the file share. Default is `"TransactionOptimized"`.
  - `enabled_protocol` (string, optional): The enabled protocol for the file share.

  Example:

  ```hcl
  file_shares = [
    { name = "share-vmlyrua-projects-2022", quota = 102400, access_tier = "TransactionOptimized" },
    { name = "share-vmlyrua-finance", quota = 102400, access_tier = "TransactionOptimized" },
    { name = "share-vmlyrua-projects-2023", quota = 102400, access_tier = "TransactionOptimized" }
  ]


## License

This project is licensed under the (LICENSE).
Copyright (c) [2023] [Shubhendu Upadhyay (shubhendu7199@gmail.com) ]

