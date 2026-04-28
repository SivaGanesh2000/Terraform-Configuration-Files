module "iam_role" {
  source = "./IAM_Role"

  assume_role_policy = file("./assume-pol.txt")
  role_name = var.cluster_role_name
}
