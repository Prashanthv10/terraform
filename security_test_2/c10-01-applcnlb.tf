module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"
  # insert the 6 required variables here
  name = "alb"
  vpc_id = module.vpc.vpc_id
  load_balancer_type = "application"

  subnets         = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  security_groups = [module.loadbalancer-sg.security_group_id]
#   internal        = false

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0   # impo: it will chhose the first target group 
    }
  ]
#   health_check = {
#     target              = "HTTP:80/"
#     interval            = 30
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 5
#   }
# ## target group details from terra registry v:8
#   target_groups = [
#   {
#     name_prefix      = "app1"
#     backend_protocol = "HTTP"
#     backend_port     = 80
#     target_type      = "instance"
#     targets = {
#       my_target = {
#         target_id = "i-0123456789abcdefg"
#         port = 80
#       }
#       my_other_target = {
#         target_id = "i-a1b2c3d4e5f6g7h8i"
#         port = 8080111
#         }
#       }
#     }
#   ]

  target_groups = [
    {
      name_prefix                       = "app1"
      backend_protocol                  = "HTTP"
      backend_port                      = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      ## app1 targets
      targets = {
        my_vm1 = {
          target_id = module.ec2-private.id[0]
          port      = 80
        },
        my_vm2 = {
          target_id = module.ec2-private.id[1]
          port      = 80
        }
      }
      tags = local.common_tags
    }
  ]
  tags = local.common_tags
}
