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

# create aws ec2 instance(s)
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = "${var.filter_name_values}"
  }
  
  filter {
    name   = "virtualization-type"
    values = "${var.filter_virtualization_type_values}"
  }
  
  owners   = "${var.owners}"
}

resource "aws_instance" "aws_ec2_web_server" {
  count           = "${var.ec2_instance_number}"
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.ec2_instance_type}"

  tags = {
    Name = "${var.region}-ubuntu-bionic}"
  }
}

# create lightsail instance(s)
resource "aws_lightsail_instance" "aws_lightsail_db_server" {
  count             = "${length(var.lightsail_instance_names)}"
  name              = "${var.lightsail_instance_names[count.index]}"
  availability_zone = "${var.lightsail_availability_zone}"
  blueprint_id      = "${var.lightsail_blueprint_id}"
  bundle_id         = "${var.lightsail_bundle_id}"
  tags = {
    lightsail_key   = "${var.lightsail_tags_values[count.index]}"
  }
}

# add more resourcess as necessary or desired.
