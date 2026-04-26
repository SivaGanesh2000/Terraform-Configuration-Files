resource "aws_iam_role_policy" "pol"{
    count = var.assume-role-policy != null ? 1:0

    name = var.inline_policy_name
    role = aws_iam_role.role.id

    policy = file(var.inline-policy)
}

resource "aws_iam_policy" "policy" {
  name = var.manag_policy_name
  policy = file(var.manag-policy)
}


resource "aws_iam_role_policy_attachment" "rpa" {
    role = aws_iam_role.role.name
    policy_arn = aws_iam_policy.policy.arn 
}