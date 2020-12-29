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


#A: define non-provider variable(s) for ec2 instances

# A1. web servers
variable "provider_name" {
 default = "AWS"
}

variable "region" {
 default = "us-east-1"
}

variable "ec2_web_server_ami_numbers" {
  # note: Ubuntu Server 18.04 LTS (HVM), SSD Volume Type => ami-07ebfd5b3428b6f4d (64-bit x86)
  # note: Amazon Linux 2 LTS with .NET Core 3.1, Mono 5.18 and PowerShell 6.2 pre-installed => ami-01fbc92d24852df9b
  # note: both have-> (1) Root device type: ebs, (2) Virtualization type: hvm, and  (3) ENA Enabled: Yes
  default = ["ami-07ebfd5b3428b6f4d", "ami-01fbc92d24852df9b"]
}

variable "ec2_web_server_types" {
  # length must equal length of "ec2_db_server_ami_number"
  # note: cpu_core_count is not supported on some instances including "t3a.nano"
  # note: for instances that support cpu_core_count, see url below:
  #    : https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-optimize-cpu.html#cpu-options-supported-instances-values
  default = ["t3a.nano", "t3a.nano"]
  #default = ["g3s.xlarge", "g3s.xlarge"]
}

variable "ec2_web_server_cpu_core_count" {
  # if specified, then "ec2_web_server_cpu_threads_per_core" must be specified
  default = 2
}

variable "ec2_web_server_cpu_threads_per_core" {
  # set to 1 for HPC applications, otherwise set to 2
  default = 2
}

variable "ec_web_server_tags_values" {
  description = "A list of ec2 (web server) tags' values of type string"
  # length must equal length of "ec2_web_server_ami_number"
  default = ["nodejs-web-server-2", "nodejs-web-server-1"]
}


# A2. database servers
variable "ec2_db_server_ami_numbers" {
  # note: Ubuntu Server 18.04 LTS (HVM), SSD Volume Type => ami-07ebfd5b3428b6f4d (64-bit x86)
  # note: (1) Root device type: ebs, (2) Virtualization type: hvm, and  (3) ENA Enabled: Yes
  default = ["ami-07ebfd5b3428b6f4d", "ami-07ebfd5b3428b6f4d"]
}

variable "ec2_db_server_types" {
  # length must equal length of "ec2_db_server_ami_number"
  # note: cpu_core_count is not supported on some instances including "t3a.nano"
  # note: for instances that support cpu_core_count, see url below:
  #    : https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-optimize-cpu.html#cpu-options-supported-instances-values
  default = ["t3a.nano", "t3a.nano"]
  #default = ["g3s.xlarge", "g3s.xlarge"]
}

variable "ec2_db_server_cpu_core_count" {
  # if specified, then "ec2_db_server_cpu_threads_per_core" must be specified
  default = 2
}

variable "ec2_db_server_cpu_threads_per_core" {
 # set to 1 for HPC applications, otherwise set to 2
  default = 2
}

variable "ec_db_server_tags_values" {
  description = "A list of ec2 (db server) tags' values of type string"
  # length must equal length of "ec2_db_server_ami_number"
  default = ["mysql-data-store", "mongodb-data-store"]
}


#B: define non-provider variable(s) for lightsail instances
variable "lightsail_names" {
  description = "A list of lightsail names of type string"
  default = ["mysql-server", "mongodb-server", "nodejs-express-server"]
}

variable "lightsail_availability_zone" {
  default = "us-east-1a"
}

variable "lightsail_blueprint_ids" {
  # length must equal length of "lightsail_names"
  default = ["ubuntu_20_04", "ubuntu_20_04", "ubuntu_20_04"]
}

variable "lightsail_bundle_ids" {
  # length must equal length of "lightsail_names"
  default = ["nano_2_0", "nano_2_0", "nano_2_0"]
}

variable "lightsail_tags_values" {
  description = "A list of lightsail tags' values of type string"
  # length must equal length of "lightsail_names"
  default = ["mysql-data-store", "mongodb-data-store", "nodejs-express"]
}

variable "aws_lightsail_static_ip" {
  default = ["static_ip_1", "static_ip_2", "static_ip_3"]
}

variable "user_data_file_path" {
  description = "Path to bash shell script (start-up script)"
  default = "./init.sh"
}

# add more variables as necessary or desired.
