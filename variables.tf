variable "name" {
  description = "Name of the SNS topic"
  type        = string

  validation {
    condition     = length(var.name) >= 1 && length(var.name) <= 256
    error_message = "SNS topic name must be between 1 and 256 characters long."
  }
}

variable "namespace" {
  description = "Namespace, which could be your organization name or abbreviation"
  type        = string

  validation {
    condition     = length(var.namespace) >= 1 && length(var.namespace) <= 64
    error_message = "Namespace must be between 1 and 64 characters long."
  }
}

variable "stage" {
  description = "Stage (e.g. 'prod', 'staging', 'dev', 'test')"
  type        = string

  validation {
    condition     = contains(["prod", "staging", "dev", "test"], var.stage)
    error_message = "Stage must be one of: prod, staging, dev, test."
  }
}

variable "attributes" {
  description = "Additional attributes (e.g. `1`)"
  type        = list(string)
  default     = []

  validation {
    condition     = length(var.attributes) <= 10
    error_message = "Maximum of 10 attributes allowed."
  }
} 