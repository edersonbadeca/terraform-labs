module "sns_subscriptions" {
  source     = "git::https://github.com/cloudposse/terraform-aws-sns-topic.git?ref=v1.2.0"
  attributes = var.attributes
  name       = var.name
  namespace  = var.namespace
  stage      = var.stage

  subscribers = {
    opsgenie = {
      protocol               = "https"
      endpoint               = "https://api.example.com/v1/"
      endpoint_auto_confirms = true
    }
  }

  sqs_dlq_enabled = false
}
