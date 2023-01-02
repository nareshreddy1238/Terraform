if multiple environments are there use commands like this  

terraform init

terraform plan -var-file="dev.tfvars" 

terraform apply -var-file="dev.tfvars"

or 

terraform init

terraform plan -var-file="qa.tfvars" 

terraform apply -var-file="qa.tfvars"
