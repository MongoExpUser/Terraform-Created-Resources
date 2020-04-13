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
#  README.md                                                                                       #
#..................................................................................................#


# Terraform-Created-Resources

<strong>Terraform module for creation of resources on public clouds platforms.</strong>

                                                                                 
Call/execute module from base file (base.tf) in the current working directory (CWD) as follows:                                  
```hcl
  $ export TF_VAR_aws_access_key="access-key-value"
  $ export TF_VAR_aws_secret_key="secret-key-value"
  $ export TF_VAR_aws_region="aws-region-value"
  $ terraform plan
  
  or
                                                                                   
  TF_VAR_aws_access_key="access-key-value" \                                         
   TF_VAR_aws_secret_key="secret-key-value" \                                        
   TF_VAR_aws_region="aws-region-value" \                                            
   terraform plan                                                                    
                                                                                    
 and                                                                                 
                                                                                    
  TF_VAR_aws_access_key="access-key-value" \                                         
   TF_VAR_aws_secret_key="secret-key-value" \                                        
   TF_VAR_aws_region="aws-region-value" \                                            
   terraform apply                                                                   
```


