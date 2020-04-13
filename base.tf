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
#  base.tf                                                                                         #
#..................................................................................................#

# define provider(s) credential variables
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

module "public_cloud_resources" {
  # 1. ssh option
  # source = "git::ssh://git@https://github.com/MongoExpUser/terraform-created-resources.git"
  # 2. https option
  source = "git::https://github.com/MongoExpUser/terraform-created-resources.git"
}

output "ec2_instances" {
  description = "A list of all created AWS' lightsail instances"
  value = "${module.public_cloud_resources.aws_ec2_instances}"
}

output "lightsail_instances" {
  description = "A list of all created AWS' lightsail instances"
  value = "${module.public_cloud_resources.aws_lightsail_instances}"
}

# add more outputs as necessary or desired
