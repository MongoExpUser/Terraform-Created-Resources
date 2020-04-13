
# Terraform module for creation of resources on public clouds platforms.

                                                                                 
Call/execute module from base file (base.tf) in the current working directory (CWD) as follows:                                  
```bash
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
