#define output(s)
output "aws_ec2_web_servers" {
  description = "A list of all created EC2 web server instances"
  # the list contains key-value pairs of each instance's attributes
  value = aws_instance.aws_ec2_web_server
}

output "aws_ec2_db_servers" {
  description = "A list of all created EC2 db server instances"
  # the list contains key-value pairs of each instance's attributes
  value = aws_instance.aws_ec2_db_server
}

output "aws_lightsail_db_servers" {
  description = "A list of all created AWS lightsail db server instances"
  # the list contains key-value pairs of each instance's attributes
  value = aws_lightsail_instance.aws_lightsail_db_server
}

# add more outputs as necessary or desired.
