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

# aws ec2 instance(s)
data "aws_ami" "ubuntu" {
  most_recent     = true
  owners          = ["099720109477"] # Canonical

  filter {
    name          = "name"
    values        = "${var.filter_name_values}"
  }
  
  filter {
    name          = "virtualization-type"
    values        = "${var.filter_virtualization_type_values}"
  }
}

resource "aws_instance" "aws_ec2_web_server" {
  count           = "${var.number_of_instance}"
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.ec2_instance_type}"

  tags = {
    Name          = "${var.region}-ubuntu-bionic}"
  }
}

# add more resourcess as necessary or desired.
