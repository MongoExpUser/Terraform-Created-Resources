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

#define non-provider variable(s)
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


# aws ec2 instance(s)
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
  
  owners = "${var.owners}"
}


resource "aws_instance" "aws_ec2_web_server" {
  count           = "${var.number_of_instance}"
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "${var.ec2_instance_type}"

  tags = {
    Name = "${var.region}-ubuntu-bionic}"
  }
}

# add more resourcess as necessary or desired.
