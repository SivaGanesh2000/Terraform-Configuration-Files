variable "assume-role-policy" {
  type = string
  description = "(REQUIRED) IAm Role's Assume Policy"
}

variable "role_name" {
  type = string
  description = "(OPTIONAL) IAM Role Name"
  default = "Terraform-Role"
}

variable "inline_policy_name" {
  type = string
  description = "(OPTIONAL) Name of the Inline policy"
  default = "Terraform-Policy"
}

variable "manag_policy_name" {
  type = string
  description = "(OPTIONAL) Name of the Management policy"
  default = "Terraform-Policy"
}

variable "inline-policy" {
  type = string
  description = "(REQUIRED) Inline Polcy, should be in JSON or YAML"
  default = null
}

variable "manag-policy" {
  type = string
  description = "(REQUIRED) Management Polcy, should be in JSON or YAML"
  default = null
}
