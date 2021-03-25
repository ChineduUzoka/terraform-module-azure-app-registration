output "application_id" {
  value       = azuread_application.app_registration.application_id
  description = "The value uniquely identifies your application in the Microsoft identity platform"
}
output "object_id" {
  value       = azuread_application.app_registration.object_id
  description = "The ID is used by the authentication library in the app as part of the validation process"
}