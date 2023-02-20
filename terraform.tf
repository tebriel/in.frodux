terraform {
  required_version = ">= 1.3.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.44.1"
    }
  }

  cloud {
    organization = "tebriel"
    workspaces {
      name = "in-frodux"
    }
  }
}

# Configure the Azure Provider
provider "azurerm" {
  features {}
}
