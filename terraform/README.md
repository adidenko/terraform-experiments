# Terraform experiments repo

## Structure

* `modules` - reusable modules
* `clusters` - infrastructure configuration based on modules. Structure is
  `clusters/{cloud-provider}/{project}/{zone}-{cluster}`

Every `clusters/{cloud-provider}/{project}/{zone}-{cluster}` is a standalone
Terraform envirionment. So plan/apply/push commands should be executed inside
each directory separately.
