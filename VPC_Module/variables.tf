variable "region" {
  type        = string
  description = "(REQUIRED) Region Id in which resources needs to be created."

  nullable = false
}

variable "vpc_cidr" {
  type        = string
  description = "(REQUIRED) CIDR Value for the VPC"

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "Cannot create CIDR!! \n Given value doesnt correspond to a valid CIDR!!"
  }

  nullable = false
}

variable "public_Subnet_CIDRs" {
  type = set(string)

  # Leave Empty if you dont want public subnets to be created
  description = "(OPTIONAL) CIDR Values for the Public Subnet."

  validation {
    condition     = alltrue([for cidr in var.public_Subnet_CIDRs : can(cidrnetmask(cidr))])
    error_message = "Cannot Create Public Subnets!! \n One or more of the values doesnt correspond to a valid CIDR!!"
  }

  nullable = true
  default  = []
}

variable "private_Subnet_CIDRs" {
  type = set(string)

  # Leave EMPTY if you dont want private subnets to be created
  description = "(OPTIONAL) CIDR Values for the Private Subnet."

  validation {
    condition     = alltrue([for cidr in var.private_Subnet_CIDRs : can(cidrnetmask(cidr))])
    error_message = "Cannot Create Private Subnets!! \n One or more of the values doesnt correspond to a valid CIDR!!"
  }

  nullable = true
  default  = []
}

variable "vpc_tags" {
  type        = map(string)
  description = "(Optional) Tags for the VPC"

  nullable = true
  default = {
    "Name" = "Terraform-VPC"
  }
}

# NOTE: If you want to provide the Name tag, just mention the name of the subnet 
# Dont need to add Public/Private/Subnet in the subnet Name tag
# The Subnet block code automatically adds "Public-Subnet/Private-Subnet" at the end of the given string
variable "subnet_tags" {
  type        = map(string)
  description = "(Optional) Tags for the subnet \n Dont Specify Public or Private in the Name tag"

  nullable = true
  default = {
    "Name" = "Terraform"
  }
}

variable "IGW_tags" {
  type        = map(string)
  description = "(Optional) Tags for the IGW"

  nullable = true
  default = {
    "Name" = "Terraform-IGW"
  }
}

# Do not provide Name tags unders "tags variable"
# If you need to provide Name tags then provide under above variable
# EX: To specify Name tag for the VPC specify under "vpc_tags variable"
variable "tags" {
  type        = map(string)
  description = "(OPTIONAL) Default Tags which applies to all the resources in this module"

  nullable = true
  default = {
    "Description" = "Created from Terraform"
  }
}