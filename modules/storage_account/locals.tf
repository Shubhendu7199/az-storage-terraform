locals {
  sa_configs = var.storage_accounts

  subnet_ids = [
    for subnet_name in flatten([
      for rule in values(local.sa_configs) :
      rule.network_rules != null ? coalesce(rule.network_rules.virtual_network_subnet_names, []) : []
    ]) :
    format(
      "/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Network/virtualNetworks/%s/subnets/%s",
      data.azurerm_subscription.current.subscription_id,
      split("/", subnet_name)[0],
      split("/", subnet_name)[1],
      split("/", subnet_name)[2],
    )
  ]

  all_file_shares = flatten([
    for sa_name, sa_config in var.storage_accounts : [
      for share in coalesce(sa_config.file_shares, []) : {
        storage_account_name = sa_config.name
        share_name           = share.name
        quota                = share.quota
        access_tier          = share.access_tier
      }
    ]
  ])


}