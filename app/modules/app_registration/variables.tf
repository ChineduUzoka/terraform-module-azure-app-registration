variable "name" {
  type        = string
  description = "The display name (multiple app registrations can share the same `display_name`) will be seen by users of this app"
}

variable "homepage_url" {
  type        = string
  description = "The URL to the application's home page"
  default = null
}

variable "logout_url" {
    type = string
    description = "value"
    default = null
}

variable "available_to_other_tenants" {
  type        = bool
  description = ""
  default     = false
}

variable "reply_urls" {
  type        = list(string)
  description = "The URI that AAD will accept as a target when returning a successful user authentication token"
  default     = []
}


variable "application_password_description" {
  type        = string
  description = "Friendly name for the password"
  default = ""
}

variable "password_expiry_in_days" {
  type        = number
  description = "The number of days which the password will expire"
  default     = 0
}

variable "api_permissions" {
  type        = any
  description = "List of API permissions."
  default     = []
}

# api_permissions = [
#     {
#       name = "Microsoft Graph"
        # delegated perms
#       oauth2_permissions = [
#         "Directory.Read.All",
#         "User.Read"
#       ]
#       application perms
#       app_roles = [
#         "Directory.Read.All"
#       ]
#     }
#   ]

variable "app_roles" {
  type = list(any)
  description = "value"
  default = []
}

variable "group_membership_claims" {
    type = string
    description = "value"
    default = "SecurityGroups"
}

variable "application_secret" {
    type = string
    description = ""
    default = "w003r0ffi499f"
}

variable "public_client" {
    type = bool
    descrption = ""
    default = false
}
