# Github repository creation using terraform

Create terraform-github-resource folder 
```sh
  mkdir terraform-github-resource
  cd terraform-github-resource
```
Using vs code create file <b>terraform.tf</b> and add following code lines
```sh
  provider "github" {
    token = ""
  }

  resource "github_repository" "terraform-first-repo" {
    name = "first-repo-from-terraform"
    description = "My awesome codebase"

    visibility = "public"
    auto-init = true
  }

  resource "github_repository" "terraform-second-repo" {
    name = "second-repo-from-terraform"
    description = "My awesome codebase"

    visibility = "public"
    auto-init = true
  }
```

Try the following commands
```sh
  terraform plan
  terraform providers
  terraform init
  terraform validate
```

Now create github credential token by going through - Settings - Developer settings - Personal access tokens - Tokens - Generate token - Copy generated token and paste it in terraform.tf file. Then run the following commands.
```sh
  terraform plan
  terraform apply --auto-approve
```

If you want to delete the resources created, use the following command.
```sh
  terraform destroy
  terraform destroy --target github-repository.terraform-second-repo
```
