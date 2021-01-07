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


# AWS

# A. define provider variable(s) for aws
variable "provider_name" {
 default = "AWS"
}


# B. define non-provider variable(s) for aws resource(s)

# B1. web servers - ec2
variable "ec2_web_server_ami_numbers" {
  # note: Ubuntu Server 20.04 LTS (HVM), SSD Volume Type => ami-0885b1f6bd170450c (64-bit x86)
  # note: Amazon Linux 2 LTS with .NET Core 3.1, Mono 5.18 and PowerShell 6.2 pre-installed => ami-01fbc92d24852df9b
  # note: both have-> (1) Root device type: ebs, (2) Virtualization type: hvm, and  (3) ENA Enabled: Yes
  default = ["ami-0885b1f6bd170450c", "ami-01fbc92d24852df9b"]
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


# B2. database servers - ec2
variable "ec2_db_server_ami_numbers" {
  # note: Ubuntu Server 20.04 LTS (HVM), SSD Volume Type => ami-0885b1f6bd170450c (64-bit x86)
  # note: (1) Root device type: ebs, (2) Virtualization type: hvm, and  (3) ENA Enabled: Yes
  default = ["ami-0885b1f6bd170450c", "ami-0885b1f6bd170450c"]
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
  default = ["mongodb-server-2", "mongodb-server-1"]
}


# B3. web servers - lightsail
variable "lightsail_web_server_names" {
  description = "A list of lightsail names of type string"
  default = ["ls-nodejs-web-server-2", "ls-nodejs-web-server-1"]
}

variable "lightsail_web_server_availability_zone" {
  default = "us-east-1a"
}

variable "lightsail_web_server_blueprint_ids" {
  # length must equal length of "lightsail_web_server_names"
  default = ["ubuntu_20_04", "ubuntu_20_04"]
}

variable "lightsail_web_server_bundle_ids" {
  # length must equal length of "lightsail_web_server_names"
  default = ["nano_2_0", "nano_2_0"]
}

variable "lightsail_web_server_tags_values" {
  description = "A list of lightsail tags' values of type string"
  # length must equal length of "lightsail_web_server_names"
  default = ["nodejs-web-server-2", "nodejs-web-server-1"]
}

variable "lightsail_web_server_static_ip" {
  default = ["static-ip-web-server-2", "static-ip-web-server-1"]
}


# B4. database servers - lightsail
variable "lightsail_db_server_names" {
  description = "A list of lightsail names of type string"
  default = ["mongodb-server-2", "mongodb-server-1"]
}

variable "lightsail_db_server_availability_zone" {
  default = "us-east-1a"
}

variable "lightsail_db_server_blueprint_ids" {
  # length must equal length of "lightsail_db_server_names"
  default = ["ubuntu_20_04", "ubuntu_20_04"]
}

variable "lightsail_db_server_bundle_ids" {
  # length must equal length of "lightsail_db_server_names"
  default = ["nano_2_0", "nano_2_0"]
}

variable "lightsail_db_server_tags_values" {
  description = "A list of lightsail tags' values of type string"
  # length must equal length of "lightsail_db_server_names"
  default = ["mongodb-server-2", "mongodb-server-1"]
}

variable "lightsail_db_server_static_ip" {
  default = ["static-ip-mongodb-server-2", "static-ip-mongodb-server-1"]
}


# B5. variable(s) common to both aws ec2 and lightsail instances
variable "web_server_user_data_file_path" {
  description = "Path to web server bash file (start-up script)"
  # note 1: before running the terraform module, the bash file (start-up script) in this path must be downloaded into the CWD
  # note 2: the CWD is assumed to be the location of the base.tf or main.tf file
  # note 3: the bash file (init_web_server.sh) can be downloaded from:  https://raw.githubusercontent.com/MongoExpUser/Terraform-Created-Resources/master/init_web_server.sh
  default = "init_web_server.sh"
}

variable "mongodb_server_user_data_file_path" {
  description = "Path to mongodb server bash file (start-up script)"
  # note 1: before running the terraform module, the bash file (start-up script) in this path must be downloaded into the CWD
  # note 2: the CWD is assumed to be the location of the base.tf or main.tf file
  # note 3: the bash file (init_mongodb_server.sh) can be downloaded from:  https://raw.githubusercontent.com/MongoExpUser/Terraform-Created-Resources/master/init_mongodb_server.sh
  default = "init_mongodb_server.sh"
}


# LINODE

# A. define provider variable(s) for linode
variable "linode_region" {
 default = "us-west"
}

# B. define non-provider variable(s) for linode resource(s)

# B1. linode sshkeys
variable "linode_sshkey_init_labels" {
  # length must equal length of "linode_web_server_labels"
  default = ["linode-sshkey-Server-2", "linode-sshkey-Server-1"]
}

# B2. linode stackscript
variable "linode_stackscript_labels" {
  default = "linode_stackscript_init"
}

variable "linode_stackscript_descriptions" {
  default = "Install Ubuntu Updates, Node.js and MongoDB."
}

variable "linode_stackscript_images" {
  default = ["linode/ubuntu20.04"]
}

variable "linode_stackscript_rev_notes" {
  default = "January-2021 version"
}

# B3. instance(2)
variable "linode_web_server_labels" {
  default = ["Nodejs-Server-2", "Nodejs-Server-1"]
}

variable "linode_web_server_types" {
  # length must equal length of "linode_web_server_labels"
  default = ["g6-nanode-1", "g6-nanode-1"]
}

variable "linode_web_server_images" {
  # length must equal length of "linode_web_server_labels"
  default = ["linode/ubuntu20.04", "linode/ubuntu20.04"]
}

variable "linode_web_server_root_passes" {
  # length must equal length of "linode_web_server_labels"
  # change the value(s) to stronger password(s) in production deployment
  default = ["root-pass-2", "root-pass-1"]
}

variable "linode_web_server_swap_sizes" {
  # length must equal length of "linode_web_server_labels"
  default = [512, 512]
}

variable "linode_web_server_private_ips" {
  # length must equal length of "linode_web_server_labels"
  default = [true, true]
}

variable "linode_web_server_tags" {
  description = "A list of linode tags' values of type string"
  # length must equal length of "linode_web_server_labels"
  default = ["Nodejs-Server-2", "Nodejs-Server-1"]
}

variable "linode_web_server_groups" {
  # length must equal length of "linode_web_server_labels"
  default = ["Web-Servers-2", "Web-Servers-1"]
}

variable "linode_web_server_package" {
  default = "Nodejs"
}


# add more variables as necessary or desired.
