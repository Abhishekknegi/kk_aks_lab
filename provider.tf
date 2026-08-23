provider "azurerm" {
  features {
  }
  resource_provider_registrations = "none"
  subscription_id                 = "a2b28c85-1948-4263-90ca-bade2bac4df4"
  environment                     = "public"
  use_msi                         = false
  use_cli                         = true
  use_oidc                        = false
}
