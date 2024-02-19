/*
output "cloud_account_access_key_id" {
  value = data.rediscloud_cloud_account.example.access_key_id
}

output "rediscloud_subscription" {
  value = data.rediscloud_subscription.example.id
}

output "rediscloud_subscription_database_id" {
  value = data.rediscloud_database.example.id
}

output "rediscloud_subscription_database_name" {
  value = data.rediscloud_database.example.name
}
*/


output "db_0_user" {
  value     = data.vault_generic_secret.redis_secrets.data["db_0_user"]
  sensitive = true
}

output "db_0_pwd" {
  value     = data.vault_generic_secret.redis_secrets.data["db_0_pwd"]
  sensitive = true
}

output "global_api_key" {
  value     = data.vault_generic_secret.redis_secrets.data["global_api_key"]
  sensitive = true
}

output "global_secret_key" {
  value     = data.vault_generic_secret.redis_secrets.data["global_secret_key"]
  sensitive = true
}

output "redis_cloud_account_id" {
  value = data.rediscloud_cloud_account.account.id
}

output "redis_cloud_account_visa_credit_card" {
  value = data.rediscloud_payment_method.card
}