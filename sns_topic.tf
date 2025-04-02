module "sns" {
  source = "cloudposse/sns-topic/aws"
  # Cloud Posse recommends pinning every module to a specific version
  version     = "v1"

  attributes = var.attributes
  name       = var.name
  namespace  = var.namespace
  stage      = var.stage

  subscribers = {
    opsgenie = {
      protocol = "https"
      endpoint = "https://api.example.com/v1/"
      endpoint_auto_confirms = true
    }
  }

  sqs_dlq_enabled = false
}
