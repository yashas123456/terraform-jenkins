terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
   features {}
   subscription_id = efff3926-ad8a-418a-a3e9-47004ef6191b 
}
