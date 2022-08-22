   
#!/bin/bash

terraform init -backend-config=environments/vpn/backend.config
terraform plan -var-file=environments/vpn/variables.tfvars  
terraform apply -var-file=environments/vpn/variables.tfvars  --auto-approve=true
# terraform destroy -var-file=environments/vpn/variables.tfvars  --auto-approve=true
