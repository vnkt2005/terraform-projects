# Terraform workspace related commands

```sh
    terraform workspace list
    terraform workspace new dev
    terraform workspace show
    terraform plan --var-file dev-terraform.tfvars
    terraform apply --auto-approve
    terraform apply --auto-approve --var-file dev-terraform.tfvars
    terraform workspace --help
    terraform workspace select dev
    terraform workspace delete prod
```