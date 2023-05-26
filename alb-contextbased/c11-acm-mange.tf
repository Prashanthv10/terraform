module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.3.2"
  domain_name  = trimsuffix(data.aws_route53_zone.mydomain.zone_id, ".")
  zone_id      = data.aws_route53_zone.mydomain.zone_id

  subject_alternative_names = [
    "*.testdevopsincloud.com"
  ]

  wait_for_validation = true

  tags = local.common_tags
}

output "certificate_arn" {
    value = module.acm.this_acm_certificate_arn
}
