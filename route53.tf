resource "aws_route53_zone" "route53" {
  name = "peters.com"
}

resource "aws_route53_record" "route53" {
  zone_id = aws_route53_zone.route53.zone_id
  name    = "peters.com"
  type    = "A"

  alias {
    name                   = aws_lb.application-load-balancer.dns_name
    zone_id                = aws_lb.application-load-balancer.zone_id
    evaluate_target_health = true
  }
}