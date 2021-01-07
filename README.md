#
# Terraform-Created-Resources

<strong>Terraform module for creation of resources on public cloud platforms.</strong>
<br>

The following public cloud platforms and resources are currently covered:
1) <strong>```AWS```</strong> - EC2 and Lightsails instances (VMs) with Node.js and MongoDB installations. <br>
    Note 1: Node.js is installed on the the web server instance(s). <br>
    Note 2: Node.js and MongoDB are installed on the db server instance(s). <br>
    Note 3: Node.js installation can be disabled on the db server instance(s): <br>
            a) By setting the variable <strong>```enable_web_server```</strong>, in the <strong>```init_mongodb_server.sh```</strong> file to <strong>```false```</strong>. <br>
            b) See line <strong>30</strong> of <strong>```init_mongodb_server.sh```</strong> file.  <br>
2) <strong>```Linode```</strong> - Linode instances (VMs) with Node.js and MongoDB installations. <br>
    Note 1: Node.js and MongoDB are installed on the web server instance(s). <br>
    Note 2: MongoDB installation can be disabled on the web server instance(s): <br>
            a) By setting the variable, <strong>```enable_mongodb_server```</strong>, to <strong>```false```</strong> in the <strong>```startup script```</strong> <br>
            b) See line <strong>122</strong> of the <strong>```main.tf```</strong> file, where <strong>```linode_stackscript_init```</strong> is defined.<br>


This repo is based on <strong>```Terraform Version 0.12.24```</strong>.

## RUNNING MODULE

### To run the module to create resources on ```AWS```:

1) Save or download the start-up bash file(s) in the link(s) below to the current working directory (CWD): <br>
   a) https://raw.githubusercontent.com/MongoExpUser/Terraform-Created-Resources/master/init_web_server.sh <br>
   b) https://raw.githubusercontent.com/MongoExpUser/Terraform-Created-Resources/master/init_mongodb_server.sh <br>

2) Also, copy the following script into a file (base.tf) in the current working directory:

```hcl
# define credential variable(s) of provider(s)
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "create_aws_resources" {default = 1}

# define provider(s)
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

# create resource(s)
module "public_cloud_resources" {
  source = "git::https://github.com/MongoExpUser/Terraform-Created-Resources.git"
}

# create output(s)
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

```


3) Finally, execute the module from the base file (base.tf) in the current working directory (CWD) by typing the following commands at the prompt (assuming running via <strong>```bash```</strong>  with <strong>```sudo```</strong> access):


```bash
  #1) run init
  sudo terraform init
  
  #2) run terraform plan
  sudo TF_VAR_aws_access_key="access-key-value" \
       TF_VAR_aws_secret_key="secret-key-value" \
       TF_VAR_aws_region="aws-region-value" \
       terraform plan
                                                                                    
  #3) run terraform apply
  sudo TF_VAR_aws_access_key="access-key-value" \
      TF_VAR_aws_secret_key="secret-key-value" \
      TF_VAR_aws_region="aws-region-value" \
      terraform apply
```



### To run the module to create resources on ```Linode```:


1) Copy the following script into a file (base.tf) in the current working directory:

```hcl
# define credential variable(s) of provider(s)
variable "linode_token_value" {}
variable "create_linode_resources" {default = 1}

# define provider(s)
provider "linode" {
  token = var.linode_token_value
}

# create resource(s)
module "public_cloud_resources" {
  source = "git::https://github.com/MongoExpUser/Terraform-Created-Resources.git"
}

# create output(s)
output "linode_sshkey_output_keys" {
  description = "A list of all created linode_sshkeys"
  # the list contains key-value pairs of each linode_sshkey's attributes
  value = module.public_cloud_resources.linode_sshkey_output
}

output "linode_stackscript_output_scripts" {
  description = "A list of all created linode_stackscripts"
  # the list contains key-value pairs of each linode_stackscript's attributes
  value =  module.public_cloud_resources.linode_stackscript_output
}

output "linode_instance_web_server_output_instances" {
  description = "A list of all created linode_instances"
  # the list contains key-value pairs of each linode_instance's attributes
  value = module.public_cloud_resources.linode_instance_web_server_output
}

```


2) Then, execute the module from the base file (base.tf) in the current working directory (CWD) by typing the following commands at the prompt (assuming running via <strong>```bash```</strong>  with <strong>```sudo```</strong> access):


```bash
  #1) run init
  sudo terraform init
  
  #2) run terraform plan
  sudo TF_VAR_linode_token_value="linode-token-value" terraform plan
                                                                                    
  #3) run terraform apply
  sudo TF_VAR_linode_token_value="linode-token-value" terraform apply
```


# License

Copyright © 2015 - present. MongoExpUser

Licensed under the MIT license.
