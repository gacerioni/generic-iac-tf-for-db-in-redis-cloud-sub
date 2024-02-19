output "cloud_account_id" {
  value = data.rediscloud_cloud_account.example.id
}

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
