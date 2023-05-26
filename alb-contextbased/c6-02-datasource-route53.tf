data "aws_route53_zone" "mydomain" {
  name         = "testdevopsincloud.net"
  # private_zone = true
}
output "zone_id" {
  value = data.aws_route53_zone.mydomain.zone_id
}
output "domain_name" {
  value = data.aws_route53_zone.mydomain.name
}