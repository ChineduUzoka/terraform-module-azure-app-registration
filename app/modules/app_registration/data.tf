data "azuread_service_principal" "main" {
  for_each = toset([
    for p in var.api_permissions : p.name
  ])
  display_name = each.key
}