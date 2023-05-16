# output "target_group_name" {
#     value = module.alb.target_group_name
# }
# output "loadbalancer-lb_arn" {
#     value = module.alb.this_lb_arn
# }
# output "loadbalancer-lb_dns_name" {
#     value = module.alb.this_lb_dns_name
# }
# output "lb_zone_id" {
#     value = module.alb.this_lb_id
# }
# output "target_group_arn_suffixes" {
#   description = "ARN suffixes of our target groups - can be used with CloudWatch."
#   value       = module.alb.target_group_arn_suffixes
# }
# output "target_group_arns" {
#   description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
#   value       = module.alb.target_group_arns
# }
# output "this_lb_arn_suffix" {
#   description = "ARN suffix of our load balancer - can be used with CloudWatch."
#   value       = module.alb.this_lb_arn_suffix
# }