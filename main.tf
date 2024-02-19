/*
data "rediscloud_subscription" "example" {
  name = "gabs-will-delete-in-15-min-terraform"
}

data "rediscloud_database" "example" {
  subscription_id = data.rediscloud_subscription.example.id
  depends_on = [data.rediscloud_subscription.example]

}
*/

data "vault_generic_secret" "redis_secrets" {
  path = "${var.vault_kv_path_and_key}"
}

data "rediscloud_cloud_account" "example" {
  exclude_internal_account = true
  provider_type = "AWS"
}