module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.3.2"
  domain_name  = trimsuffix(data.aws_route53_zone.mydomain.id, ".")
  zone_id      = data.aws_route53_zone.mydomain.id

  subject_alternative_names = [
    "*.testdevopsincloud.net"
  ]

  wait_for_validation = true

  tags = local.common_tags
}

output "certificate_arn" {
    value = module.acm.acm_certificate_arn
}
