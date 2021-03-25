resource "azuread_application" "app_registration" {
  display_name               = var.name
  homepage                   = var.homepage_url
  available_to_other_tenants = var.available_to_other_tenants
  reply_urls                 = var.reply_urls
  logout_url                 = var.logout_url
  group_membership_claims    = var.group_membership_claims
  public_client              = var.public_client


  dynamic "required_resource_access" {
    for_each = local.required_resource_access

    content {
      resource_app_id = required_resource_access.value.resource_app_id

      dynamic "resource_access" {
        for_each = required_resource_access.value.resource_access

        content {
          id   = resource_access.value.id
          type = resource_access.value.type
        }
      }
    }
  }

  dynamic "app_role" {
    for_each = local.app_roles

    content {
      allowed_member_types = app_role.value.member_types
      display_name         = app_role.value.name
      description          = app_role.value.description
      value                = coalesce(app_role.value.value, app_role.value.name)
      is_enabled           = app_role.value.enabled
    }
  }

}
