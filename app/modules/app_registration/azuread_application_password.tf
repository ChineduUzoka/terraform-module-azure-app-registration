resource "azuread_application_password" "app_registration_password" {
  application_object_id = azuread_application.app_registration.id
  description           = var.application_password_description
  end_date_relative     = local.application_password_end_date
  key_id                = random_uuid.unique_guid.result
  value                 = var.application_secret
}

resource "random_uuid" "unique_guid" {
  keepers = {
    secret = var.application_secret
  }
}

