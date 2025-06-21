terraform {
  # Specifies the minimum Terraform version required for this configuration.
  required_version = ">=0.13.0"

  # Specifies the required provider configurations for this Terraform project.
  required_providers {
    aws = {
      # The minimum version of the AWS provider required for this configuration.
      version = ">= 2.7.0"
      
      # The source of the AWS provider, using the HashiCorp registry.
      source  = "hashicorp/aws"
    }
  }
}
