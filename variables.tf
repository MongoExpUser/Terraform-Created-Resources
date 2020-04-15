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


#define non-provider variable(s) for ec2
variable "ec2_instance_number" {
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


#define non-provider variable(s) for lightsail
variable "lightsail_instance_names" {
  description = "A list of lightsail names of type string"
  default = ["lightsail_mysql_server", "lightsail_mongodb_server"]
}

variable "light_sail_availability_zone" {
  default = "us-east-1a"
}

variable "lightsail_blueprint_id" {
  default = "ubuntu_18_04"
}

variable "lightsail_bundle_id" {
  default = "nano_2_0"
}

variable "lightsail_tags_values" {
  description = "A list of lightsail tags' values of type string"
  default = ["db1_mysql", "db2_mongodb"]
}
