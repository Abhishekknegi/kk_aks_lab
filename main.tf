#resource "azurerm_resource_group" "res-0" {
#  location = "eastus"
#  name     = "kml_rg_main-19d2f0ed17474c04"
#}

data "azurerm_resource_group" "res-0" {
  name = "kml_rg_main-e2da110263a84b90"
}
resource "azurerm_kubernetes_cluster" "res-1" {
  automatic_upgrade_channel    = "patch"
  dns_prefix                   = "abhaks01-dns"
  image_cleaner_interval_hours = 168
  local_account_disabled       = true
  location                     = "eastus"
  name                         = "abhaks01"
  resource_group_name          = data.azurerm_resource_group.res-0.name
  sku_tier                     = "Standard"
  azure_active_directory_role_based_access_control {
    admin_group_object_ids = ["a02e36ff-459f-45f5-bae9-c86f0ad40599"]
    tenant_id              = "30fe8ff1-adc6-444d-ba94-1238894df42c"
  }
  #default_node_pool {
  #  auto_scaling_enabled = true
  #  max_count            = 2
  #  min_count            = 1
  #  name                 = "agentpool"
  #  upgrade_settings {
  #    max_surge = "10%"
  #  }
  default_node_pool {
    auto_scaling_enabled = true
    name                 = "agentpool"
    vm_size              = "Standard_D2s_v3"
    node_count           = 1

    min_count = 1
    max_count = 2
    upgrade_settings {
      max_surge = "10%"
    }

  }
  identity {
    type = "SystemAssigned"
  }

  maintenance_window_auto_upgrade {
    day_of_week = "Sunday"
    duration    = 8
    frequency   = "Weekly"
    interval    = 1
    start_time  = "00:00"
    utc_offset  = "+00:00"
  }
  maintenance_window_node_os {
    day_of_week = "Sunday"
    duration    = 8
    frequency   = "Weekly"
    interval    = 1
    start_time  = "00:00"
    utc_offset  = "+00:00"
  }
}
