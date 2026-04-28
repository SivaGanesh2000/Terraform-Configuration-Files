output "IAM_Details"{
  value = {
    "Role_Name" = aws_iam_role.role.name
    "Role_Arn" = aws_iam_role.role.arn
  }
}
