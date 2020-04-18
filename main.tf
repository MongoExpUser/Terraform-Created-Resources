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
#  main.tf                                                                                         #
#..................................................................................................#

# create aws ec2 instance(s), using "aws_instance" statement with ami-number
resource "aws_instance" "aws_ec2_web_server" {
  count                 = length(var.ec2_web_server_ami_numbers)
  ami                   = var.ec2_web_server_ami_numbers[count.index]
  instance_type         = var.ec2_web_server_types[count.index]
  
  #note: cpu_core_count and cpu_threads_per_core are not supported on "t3a.nano"
  #cpu_core_count       = var.ec2_web_server_cpu_core_count
  #cpu_threads_per_core = var.ec2_web_server_cpu_threads_per_core

  tags = {
    ec2_key = var.ec_web_server_tags_values[count.index]
  }
}

resource "aws_instance" "aws_ec2_db_server" {
  count                 = length(var.ec2_db_server_ami_numbers)
  ami                   = var.ec2_db_server_ami_numbers[count.index]
  instance_type         = var.ec2_db_server_types[count.index]
  
  #note: cpu_core_count and cpu_threads_per_core are not supported on "t3a.nano"
  #cpu_core_count       = var.ec2_db_server_cpu_core_count
  #cpu_threads_per_core = var.ec2_db_server_cpu_threads_per_core

  tags = {
    ec2_key = var.ec_db_server_tags_values[count.index]
  }
}

# create lightsail instance(s)
resource "aws_lightsail_instance" "aws_lightsail_db_server" {
  count                 = length(var.lightsail_names)
  name                  = var.lightsail_names[count.index]
  availability_zone     = var.lightsail_availability_zone
  blueprint_id          = var.lightsail_blueprint_ids[count.index]
  bundle_id             = var.lightsail_bundle_ids[count.index]
  tags = {
    lightsail_key = var.lightsail_tags_values[count.index]
  }
}

# add more resourcess as necessary or desired.
