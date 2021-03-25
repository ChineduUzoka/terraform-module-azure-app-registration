resource "random_id" "test" {
  byte_length = 4
}

module "simple" {
  source = "../../app/modules/app_registration"

  name = format("test-%s", random_id.test.hex)

  group_membership_claims = "All"

  password_expiry_in_days = 30

  api_permissions = [
    {
      name = "Microsoft Graph"
      oauth2_permissions = [
        "Directory.Read.All",
        "User.Read"
      ]
      app_roles = [
        "Directory.Read.All"
      ]
    }
  ]

  app_roles = [
    {
      name        = "test"
      description = "test"
      member_types = [
        "Application"
      ]
    }
  ]
}
