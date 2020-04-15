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


#define output(s)
output "aws_ec2_instances" {
  description = "A list of all created AWS' EC2 instances"
  value = "${aws_instance.aws_ec2_web_server}"
}

output "aws_lightsail_instances" {
  description = "A list of all created AWS' lightsail instances"
  value = "${aws_lightsail_instance.aws_lightsail_db_server}"
}

# add more outputs as necessary or desired.
