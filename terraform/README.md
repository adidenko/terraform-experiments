# Terraform experiments repo

## Structure

* `modules` - reusable modules
* `deplyoments` - infrastructure configuration based on modules. Structure is
  `deplyoments/{cloud-provider}/{project}/{zone}-{cluster}`

Every `deplyoments/{cloud-provider}/{project}/{zone}-{cluster}` is a standalone
Terraform envirionment. So plan/apply/push commands should be executed inside
each directory separately.

## Terragrunt

In order to deploy whole infrastructure with a single command please use
[terragrunt](https://github.com/gruntwork-io/terragrunt)

```
cd deployment
terragrunt plan-all
terragrunt apply-all
```
