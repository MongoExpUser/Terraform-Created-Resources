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
  default = 1
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

# add more variables as necessary or desired
