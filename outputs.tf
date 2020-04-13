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

output "aws_ec2_instances" {
  description = "A list of all created AWS' ec2 instances"
  value = "${aws_instance.aws_ec2_web_server}"
}

# add more outputs as necessary or desired.
