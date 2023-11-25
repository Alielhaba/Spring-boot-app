# Configure the AWS Provider
provider "aws" {
  region = var.region
  shared_config_files      = ["/home/alielhabal/.aws/config"]
  shared_credentials_files = ["/home/alielhabal/.aws/credentials"]
}