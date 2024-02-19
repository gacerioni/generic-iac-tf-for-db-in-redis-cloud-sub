terraform {
  required_providers {
    rediscloud = {
      source = "RedisLabs/rediscloud"
      version = "1.5.0"
    }
  }
}

provider "rediscloud" {
  # Configuration options
  api_key = var.redis_global_api_key
  secret_key = var.redis_global_secret_key
}