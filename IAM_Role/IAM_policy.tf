resource "aws_iam_role_policy" "pol"{
    count = var.inline-policy != null ? 1:0

    name = var.inline_policy_name
    role = aws_iam_role.role.id

    policy = try(jsonencode(yamldecode(file(var.inline-policy))), null)
}

resource "aws_iam_policy" "policy" {
  count = var.manag-policy != null ? 1:0
  name = var.manag_policy_name
  policy = try(jsonencode(yamldecode(file(var.manag-policy))), null)
}


resource "aws_iam_role_policy_attachment" "rpa" {
    count = var.manag-policy != null ? 1:0
    role = aws_iam_role.role.name
    policy_arn = aws_iam_policy.policy[*].arn 
}
