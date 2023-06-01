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



#### line no 14 to 20 is for http listners for alb
/*
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0   # impo: it will chhose the first target group 
    }
  ]
  */



## HTTP to HTTPS redirect#######  for context based alb
  http_tcp_listeners = [
  {
    port        = 80
    protocol    = "HTTP"
    action_type = "redirect"
    redirect = {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
]

  target_groups = [   ### there are 2 target groups
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
    },
    {
      name_prefix                       = "app2"
      backend_protocol                  = "HTTP"
      backend_port                      = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app2/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      ## app2 targets
      targets = {
       app2_vm1 = {
          target_id = module.ec2-private-app2.id[0]
          port      = 80
        },
        app2_vm2 = {
          target_id = module.ec2-private-app2.id[1]
          port      = 80
        }
      }
      tags = local.common_tags
    }
  ]

  # https listeners and fixed response 
    ########## fixed response for - You can use fixed-response actions to drop client requests and return a custom HTTP response

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = module.acm.acm_certificate_arn
      action_type = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed message"
        status_code  = "200"

    }
    }
  ]
  #https listeners rules
  https_listener_rules = [
    #############rule 1
  {
    https_listener_index = 0                # '0' because we have one https listeners
    priority = 1
    actions = [
      {
        type               = "forward"
        target_group_index = 0        # for app1
      }
    ]

    conditions = [{
      http_headers = [{
        http_header_name = "custom - header"
        values           = ["app1", "app-1", "my-app-1"]
      }]
    }]
  },
  ##rule 2
    {
    https_listener_index = 0  
    priority = 2             # '0' because we have one https listeners

    actions = [
      {
        type               = "forward"
        target_group_index = 1 # for app2
      }
    ]

    # conditions = [{
    #   path_patterns = ["/app2*"]
    #   host_headers = [var.app2_dns_name]
    # }]
    conditions = [{
      http_headers = [{
        http_header_name = "custom - header"
        values           = ["app2", "app-2", "my-app-2"]
      }]
    }]
  },

  ######################## rule 3 ######################
    {
    https_listener_index = 0
    priority             = 3
    actions = [{
      type        = "redirect"
      status_code = "HTTP_302"
      host        = "www.youtube.com"
      path        = "/watch"
      query       = "v=dQw4w9WgXcQ"
      protocol    = "HTTPS"
    }]

    conditions = [{
      query_strings = [{
        key   = "website"
        value = "aws-eks"
      }]
    }]
  },
      {
    https_listener_index = 0
    priority             = 4
    actions = [{
      type        = "redirect"
      status_code = "HTTP_302"
      host        = "www.youtube.com"
      path        = "/watch"
      query       = "v=dQw4w9WgXcQ"
      protocol    = "HTTPS"
    }]

    conditions = [{
      host_headers = [""]
    }]
  }
    
  ]

  tags = local.common_tags
}
