mock_provider "aws" {
  mock_resource "aws_sns_topic" {
    defaults = {
      arn = "arn:aws:s3:::test-bucket-name"
    }
  }
}
run "validate_variables" {
  command = plan

  variables {
    name       = "test-topic"
    namespace  = "test"
    stage      = "dev"
    attributes = ["1"]
  }

}