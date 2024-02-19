variable "redis_global_api_key" {
  description = "Global API key for Redis Cloud account"
  type        = string
  default = "incorrect"
  sensitive   = true
}

variable "redis_global_secret_key" {
    description = "Global API Secret (USER KEY) for Redis Cloud account"
    type        = string
    default     = "incorrect"
    sensitive   = true
}