resource "aws_iam_role" "role"{
    name = var.role_name
    assume_role_policy = jsonencode(yamldecode(var.assume-role-policy))
}
