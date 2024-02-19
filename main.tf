data "rediscloud_cloud_account" "example" {
  exclude_internal_account = true
  provider_type = "AWS"
}

data "rediscloud_subscription" "example" {
  name = "gabs-will-delete-in-15-min-terraform"
}

data "rediscloud_database" "example" {
  subscription_id = data.rediscloud_subscription.example.id
  depends_on = [data.rediscloud_subscription.example]

}