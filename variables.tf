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
#  variables.tf                                                                                    #
#..................................................................................................#

variable "number_of_instance" {
  default = 2
}

variable "provider_name" {
 default = "AWS"
}

variable "region" {
 default = "us-east-1"
}

variable "ec2_instance_type" {
  #default = "t2.micro"
  default = "t3a.nano"
}

variable "filter_name_values" {
 default = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
}

variable "filter_virtualization_type_values" {
 default = ["hvm"]
}

variable "owners" {
 default = ["099720109477"] # Canonical
}

# add more variables as necessary or desired.
