#
# Terraform-Created-Resources

<strong>Terraform module for creation of resources on public cloud platforms.</strong>

This repo is based on <strong>```Terraform Version 0.12.24```</strong>.

#
<strong>Running Module</strong>
#

To run the module:

1) Copy the following script into a file (base.tf) in the current working directory:

```hcl
# define provider(s) credential variables
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

module "public_cloud_resources" {
  source = "git::https://github.com/MongoExpUser/Terraform-Created-Resources.git"
}

output "ec2_web_server_instances" {
  description = "A list of all created EC2 web server instances"
  # the list contains key-value pairs of each instance's attributes
  value = module.public_cloud_resources.aws_ec2_web_servers
}

output "ec2_db_server_instances" {
  description = "A list of all created EC2 db server instances"
  # the list contains key-value pairs of each instance's attributes
  value = module.public_cloud_resources.aws_ec2_db_servers
}

output "lightsail_web_server_instances" {
  description = "A list of all created AWS lightsail web server instances"
  # the list contains key-value pairs of each instance's attributes
  value = module.public_cloud_resources.aws_lightsail_web_servers
}

output "lightsail_db_server_instances" {
  description = "A list of all created AWS lightsail db server instances"
  # the list contains key-value pairs of each instance's attributes
  value = module.public_cloud_resources.aws_lightsail_db_servers
}

output "lightsail_web_server_static_ips" {
  description = "A list of all created AWS lightsail static ips"
  # the list contains key-value pairs of each instance's attributes
  value = module.public_cloud_resources.aws_lightsail_web_server_static_ips
}

output "lightsail_db_server_static_ips" {
  description = "A list of all created AWS lightsail static ips"
  # the list contains key-value pairs of each instance's attributes
  value = module.public_cloud_resources.aws_lightsail_db_server_static_ips
}


# add more outputs as necessary or desired.
```


2) Execute the module from the base file (base.tf) in the current working directory (CWD) by typing the following commands at the prompt (assuming running via <strong>```bash```</strong>  with <strong>```sudo```</strong> access):


```bash
  #1) init
  sudo terraform init
  
  #2) terraform plan
  sudo TF_VAR_aws_access_key="access-key-value" \
       TF_VAR_aws_secret_key="secret-key-value" \
       TF_VAR_aws_region="aws-region-value" \
       terraform plan
                                                                                    
  #3) terraform apply
  sudo TF_VAR_aws_access_key="access-key-value" \
      TF_VAR_aws_secret_key="secret-key-value" \
      TF_VAR_aws_region="aws-region-value" \
      terraform apply
```

# License

Copyright © 2015 - present. MongoExpUser

Licensed under the MIT license.


