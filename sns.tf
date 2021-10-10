#  Create an SNS Topic
#   Terraform aws create sns topic

resource "aws_sns_topic" "user_updates" {

    name = "update_topic"
  
}

# Create an SNS Topic Subscription
# terraform aws sns topic subscription

resource "aws_sns_topic_subscription" "notification-topic" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "email"
  endpoint  = "${var.endpoint-email}"
}