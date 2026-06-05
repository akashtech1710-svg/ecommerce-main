terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket       = "opentelematory-statefile"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}