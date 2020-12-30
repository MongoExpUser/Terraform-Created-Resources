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


# download relevant bash shell scripts (start-up scripts)
resource "null_resource" "start_up_scripts" {
  provisioner "local-exec" {
    command = "sudo wget https://github.com/MongoExpUser/Terraform-Created-Resources/blob/master/${var.web_server_user_data_file_path} -P /home/"
  }
}

# create aws ec2 instance(s), using "aws_instance" statement with ami-number
resource "aws_instance" "aws_ec2_web_server" {
  count                 = length(var.ec2_web_server_ami_numbers)
  ami                   = var.ec2_web_server_ami_numbers[count.index]
  instance_type         = var.ec2_web_server_types[count.index]
  #note: cpu_core_count and cpu_threads_per_core are not supported on "t3a.nano"
  #cpu_core_count       = var.ec2_web_server_cpu_core_count
  #cpu_threads_per_core = var.ec2_web_server_cpu_threads_per_core
  #user data file: bash shell script (start-up script)
  user_data             = file(var.web_server_user_data_file_path)
  tags = {
    Name = var.ec_web_server_tags_values[count.index]
  }
  depends_on     = [null_resource.start_up_scripts]
}

resource "aws_instance" "aws_ec2_db_server" {
  count                 = length(var.ec2_db_server_ami_numbers)
  ami                   = var.ec2_db_server_ami_numbers[count.index]
  instance_type         = var.ec2_db_server_types[count.index]
  #note: cpu_core_count and cpu_threads_per_core are not supported on "t3a.nano"
  #cpu_core_count       = var.ec2_db_server_cpu_core_count
  #cpu_threads_per_core = var.ec2_db_server_cpu_threads_per_core
  tags = {
    Name = var.ec_db_server_tags_values[count.index]
  }
}


# create lightsail instance(s)
resource "aws_lightsail_instance" "aws_lightsail_web_server" {
  count                 = length(var.lightsail_web_server_names)
  name                  = var.lightsail_web_server_names[count.index]
  availability_zone     = var.lightsail_web_server_availability_zone
  blueprint_id          = var.lightsail_web_server_blueprint_ids[count.index]
  bundle_id             = var.lightsail_web_server_bundle_ids[count.index]
  # user data file: bash shell script (start-up script)
  user_data             = file(var.web_server_user_data_file_path)
  tags = {
    Name = var.lightsail_web_server_tags_values[count.index]
  }
  depends_on     = [null_resource.start_up_scripts]
}

resource "aws_lightsail_instance" "aws_lightsail_db_server" {
  count                 = length(var.lightsail_db_server_names)
  name                  = var.lightsail_db_server_names[count.index]
  availability_zone     = var.lightsail_db_server_availability_zone
  blueprint_id          = var.lightsail_db_server_blueprint_ids[count.index]
  bundle_id             = var.lightsail_db_server_bundle_ids[count.index]
  tags = {
    Name = var.lightsail_db_server_tags_values[count.index]
  }
}


# create lightsail instance(s) static ip(s): web server
resource "aws_lightsail_static_ip" "aws_lightsail_web_server_static_ips" {
  count         = length(var.lightsail_web_server_static_ip)
  name          = var.lightsail_web_server_static_ip[count.index]
  depends_on    = [aws_lightsail_instance.aws_lightsail_web_server]
}

# attach lightsail instance(s) to static ip(s): web server
resource "aws_lightsail_static_ip_attachment" "aws_lightsail_web_server_static_ip_attachments" {
  count          = length(var.lightsail_web_server_names)
  static_ip_name = aws_lightsail_static_ip.aws_lightsail_web_server_static_ips[count.index].id
  instance_name  = aws_lightsail_instance.aws_lightsail_web_server[count.index].id
  depends_on     = [aws_lightsail_static_ip.aws_lightsail_web_server_static_ips]
}


# create lightsail instance(s) static ip(s): db server
resource "aws_lightsail_static_ip" "aws_lightsail_db_server_static_ips" {
  count         = length(var.lightsail_db_server_static_ip)
  name          = var.lightsail_db_server_static_ip[count.index]
  depends_on    = [aws_lightsail_instance.aws_lightsail_db_server]
}

# attach lightsail instance(s) to static ip(s): db server
resource "aws_lightsail_static_ip_attachment" "aws_lightsail_db_server_static_ip_attachments" {
  count          = length(var.lightsail_db_server_names)
  static_ip_name = aws_lightsail_static_ip.aws_lightsail_db_server_static_ips[count.index].id
  instance_name  = aws_lightsail_instance.aws_lightsail_db_server[count.index].id
  depends_on     = [aws_lightsail_static_ip.aws_lightsail_db_server_static_ips]
}


# add more resourcess as necessary or desired.
