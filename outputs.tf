#..................................................................................................#
#                                                                                                  #
#  @License Starts                                                                                 #
#                                                                                                  #
#  Copyright © 2015 - present. MongoExpUser                                                        #
#                                                                                                  #
#  License: MIT - https://github.com/MongoExpUser/Terraform-Created-Resources/blob/master/LICENSE  #
#                                                                                                  #
#  @License Ends                                                                                   #
#                                                                                                  #
#..................................................................................................#
#  outputs.tf                                                                                      #
#..................................................................................................#


#define output(s) for aws resource(s)
output "aws_ec2_web_servers" {
  description = "A list of all created EC2 web server instances"
  # the list contains key-value pairs of each instance's attributes
  value = aws_instance.aws_ec2_web_server
}

output "aws_ec2_db_servers" {
  description = "A list of all created EC2 db server instances"
  # the list contains key-value pairs of each instance's attributes
  value = aws_instance.aws_ec2_db_server
}

output "aws_lightsail_web_servers" {
  description = "A list of all created AWS lightsail server instances"
  # the list contains key-value pairs of each instance's attributes
  value = aws_lightsail_instance.aws_lightsail_web_server
}

output "aws_lightsail_db_servers" {
  description = "A list of all created AWS lightsail server instances"
  # the list contains key-value pairs of each instance's attributes
  value = aws_lightsail_instance.aws_lightsail_db_server
}

output "aws_lightsail_web_server_static_ips" {
  description = "A list of all created AWS lightsail web server  static ips"
  # the list contains key-value pairs of each instance's attributes
  value = aws_lightsail_static_ip.aws_lightsail_web_server_static_ips
}

output "aws_lightsail_db_server_static_ips" {
  description = "A list of all created AWS lightsail db server static ips"
  # the list contains key-value pairs of each instance's attributes
  value = aws_lightsail_static_ip.aws_lightsail_db_server_static_ips
}


# define outputs for linode resource(s)
output "linode_sshkeys" {
  description = "A list of all created linode_sshkeys"
  # the list contains key-value pairs of each linode_sshkey's attributes
  value = linode_sshkey.linode_sshkey_init
}

output "linode_stackscripts" {
  description = "A list of all created linode_stackscripts"
  # the list contains key-value pairs of each linode_stackscript's attributes
  value = linode_stackscript.linode_stackscript_init
}

output "linode_instance_web_servers" {
  description = "A list of all created linode_instances"
  # the list contains key-value pairs of each linode_instance's attributes
  value = linode_instance.linode_instance_web_server_init
}


# add more outputs as necessary or desired.
