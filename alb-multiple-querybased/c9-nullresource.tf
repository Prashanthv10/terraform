# resource "null_resource" "name" {
#   depends_on = [ module.ec2-public ]

#   connection {
#     type = "ssh"
#     host = aws_eip.lb.public_ip
#     private_key = file("private-key/terraform-key.pem")
#     user = "ec2-user"
#     password = ""
#   }
#   provisioner "file" {
#     source = "private-key/terraform-key.pem"
#     destination = "/tmp/terraform-key.pem"
#   }
#   provisioner "remote-exec" {
#   inline = [
#     "sudo chmod 400 /tmp/terraform-key.pem"
#   ]
#   }
#   provisioner "local-exec" {
#     command = "echo vpc created on 'date' VPC ID: ${module.vpc.vpc_id} >> creationtime_vpc.txt"
#     working_dir = "local-exec-output-files/"
#   }
#   ## Local Exec Provisioner:  local-exec provisioner (Destroy-Time Provisioner - Triggered during deletion of Resource)
#   # provisioner "local-exec" {
#   #   command = "echo Destroy time prov `date` >> destroy-time-prov.txt"
#   #   working_dir = "local-exec-output-files/"
#   #   when = destroy
#   #   #on_failure = continue
#   # }
# }