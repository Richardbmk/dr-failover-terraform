# Get Hosted Zone ID (Should already exist in Route53)
data "aws_route53_zone" "selected" {
  name = var.domain_name
}

# Route53 Record - conditional based on dr_switchover variable
resource "aws_route53_record" "test" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "${var.subdomain}.${var.domain_name}"
  type    = "A"
  ttl = 60
  records = [var.dr_switchover ? aws_instance.dr_webserver[0].public_ip : aws_instance.prod_webserver.public_ip]
}