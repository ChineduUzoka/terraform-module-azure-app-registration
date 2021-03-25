terraform {
  required_version = ">= 0.13.0, ~> 0.14"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "1.4.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.7.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}