#.....................................................................................#
#                                                                                     #
#  @License Starts                                                                    #
#                                                                                     #
#  Copyright © 2015 - present. MongoExpUser                                           #
#                                                                                     #
#  License: MIT - See: https://github.com/MongoExpUser//blob/master/README.md         #
#                                                                                     #
#  @License Ends                                                                      #
#                                                                                     #
#.....................................................................................#
#  base.tf - base file: all modules are called from this base file                    #
#                                                                                     #                                                                                             #
#  Terraform modules for creation of resources on on public clouds platforms.         #
#                                                                                     #
#  Call/execute module base file (base.tf) as:                                        #
#                                                                                     #
#  TF_VAR_aws_access_key="access-key-value" \                                         #
#   TF_VAR_aws_secret_key="secret-key-value" \                                        #
#   TF_VAR_aws_region="aws-region-value" \                                            #
#   terraform plan                                                                    #
#                                                                                     #
# and                                                                                 #
#                                                                                     #
#  TF_VAR_aws_access_key="access-key-value" \                                         #
#   TF_VAR_aws_secret_key="secret-key-value" \                                        #
#   TF_VAR_aws_region="aws-region-value" \                                            #
#   terraform apply                                                                   #
#.....................................................................................#

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
