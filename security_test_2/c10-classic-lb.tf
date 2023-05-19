module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "2.5.0"
  # insert the 6 required variables here
  name = "elb"

  subnets         = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  security_groups = [aws_security_group.loadbalancer-sg.id]
#   internal        = false

  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    },
    {
      instance_port     = 81
      instance_protocol = "http"
      lb_port           = 81
      lb_protocol       = "http"
    # ssl_certificate_id = "arn:aws:acm:eu-west-1:235367859451:certificate/6c270328-2cd5-4b2d-8dfd-ae8d0004ad31"
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

#   access_logs = {
#     bucket = "my-access-logs-bucket"
#   }

  // ELB attachments
  number_of_instances = 2
  instances           = ["i-06ff41a77dfb5349d", "i-4906ff41a77dfb53d"]

  tags = local.common_tags
}