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

variable "manag-policy-arn"{
  type = list(string)
  description = "(OPTIONAL) Policy ARN that needs to be attached to IAM ROLE"
  default = null
}

variable "inline-policy" {
  type = string
  description = "(OPTIONAL) Inline Polcy, should be in YAML"
  default = null
}

variable "manag-policy" {
  type = string
  description = "(OPTIONAL) Management Polcy, should be in YAML"
  default = null
}
  