#
# Terraform-Created-Resources

<strong>Terraform module for creation of resources on public cloud platforms.</strong>

This repo is based on <strong>```Terraform Version 0.12.23```</strong>.

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
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

module "public_cloud_resources" {
  source = "git::https://github.com/MongoExpUser/Terraform-Created-Resources.git"
}

output "ec2_instances" {
  description = "A list of all created AWS' EC2 instances"
  value = "${module.public_cloud_resources.aws_ec2_instances}"
}

# add more outputs as necessary or desired
```


2) Execute the module from the base file (base.tf) in the current working directory (CWD) by typing the following commands at the prompt (assuming running via <strong>```bash```</strong>  with <strong>```sudo```</strong> access):


```bash
  sudo terraform init
  
  and

  sudo TF_VAR_aws_access_key="access-key-value" \
       TF_VAR_aws_secret_key="secret-key-value" \
       TF_VAR_aws_region="aws-region-value" \
       terraform plan
                                                                                    
 and
                                                                                    
  TF_VAR_aws_access_key="access-key-value" \
   TF_VAR_aws_secret_key="secret-key-value" \
   TF_VAR_aws_region="aws-region-value" \
   terraform apply
```
