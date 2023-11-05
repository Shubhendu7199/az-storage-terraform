module "sa" {
  source           = "./modules/storage_account_new"
  storage_accounts = var.storage_accounts
}