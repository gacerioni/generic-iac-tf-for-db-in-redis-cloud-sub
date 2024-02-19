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

data "rediscloud_cloud_account" "account" {
  exclude_internal_account = true
  provider_type = "AWS"
}

data "rediscloud_payment_method" "card" {
  card_type = "Visa"
}

// HERE I CREATE A SUBSCRIPTION IN REDIS CLOUD
resource "rediscloud_subscription" "subscription-resource" {

  name = "gabs-test-terraform-temporary"
  payment_method = "credit-card"
  payment_method_id = data.rediscloud_payment_method.card.id
  memory_storage = "ram"
  redis_version = "latest"

  cloud_provider {
    provider = data.rediscloud_cloud_account.account.provider_type
    region {
      region = "us-east-1"
      multiple_availability_zones = false
      networking_deployment_cidr = "10.0.42.0/24"
      #preferred_availability_zones = ["us-east-1a"]
    }
  }

  // This block needs to be defined for provisioning a new subscription.
  // This allows creation of a well-optimized hardware specification for databases in the cluster
  creation_plan {
    memory_limit_in_gb = 0.1
    quantity = 1
    replication= false
    throughput_measurement_by = "number-of-shards"
    throughput_measurement_value = 1
    modules = ["RedisJSON", "RediSearch", "RedisTimeSeries", "RedisBloom"]
  }
}