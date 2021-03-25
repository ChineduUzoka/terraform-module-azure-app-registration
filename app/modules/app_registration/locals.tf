locals {
  application_password_end_date = var.password_expiry_in_days == 0 ? format("%dh", (365 * 2) * 24) : format("%dh", var.password_expiry_in_days * 24)
  api_permissions = [
    for p in var.api_permissions : merge({
      id : ""
      name : ""
      app_roles : []
      oauth2_permissions : []
    }, p)
  ]

  api_names = local.api_permissions[*].name

  service_principals = {
    for s in data.azuread_service_principal.main : s.display_name => {
      application_id     = s.application_id
      display_name       = s.display_name
      app_roles          = { for p in s.app_roles : p.value => p.id }
      oauth2_permissions = { for p in s.oauth2_permissions : p.value => p.id }
    }
  }

  required_resource_access = [
    for a in local.api_permissions : {
      resource_app_id = local.service_principals[a.name].application_id
      resource_access = concat(
        [for p in a.oauth2_permissions : {
          id   = local.service_principals[a.name].oauth2_permissions[p]
          type = "Scope"
        }],
        [for p in a.app_roles : {
          id   = local.service_principals[a.name].app_roles[p]
          type = "Role"
        }]
      )
    }
  ]

  app_roles = [
    for r in var.app_roles : merge({
      name         = ""
      description  = ""
      member_types = []
      enabled      = true
      value        = ""
    }, r)
  ]
}