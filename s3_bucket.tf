module "s3_bucket" {
  source    = "cloudposse/s3-bucket/aws"
  version   = "v4.8.0"
  name      = "app"
  stage     = "test"
  namespace = "eg"

  s3_object_ownership = "BucketOwnerEnforced"
  enabled             = true
  user_enabled        = false
  versioning_enabled  = false

  privileged_principal_actions = ["s3:GetObject", "s3:ListBucket", "s3:GetBucketLocation"]
  privileged_principal_arns = [
    {
      (local.deployment_iam_role_arn) = [""]
    },
    {
      (local.additional_deployment_iam_role_arn) = ["prefix1/", "prefix2/"]
    }
  ]
}
