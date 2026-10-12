
terraform {
  backend "s3" {
    bucket       = "voteapp-tfstate-dnto-10"
    key          = "project1/dev/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}