variable "region"{
    type = string
    description = "(REQUIRED) Region Id"
}

variable "ECR_repo_name"{
    type = string
    description = "(REQUIRED) Name of the Container Repository"

    validation {
      condition = can(regex("^[a-z][a-z0-9\\_\\-\\/\\.]*$", var.ECR_repo_name))
      error_message = "Name can contain only lower alphabes and special characters:'_-/.' and numbers!!"
    }

    validation {
      condition = length(var.ECR_repo_name) >= 2 && length(var.ECR_repo_name) <= 256
      error_message = "Name shoueld contain minimum 2 characters and maximum of 256 characters"
    }
}