resource "aws_eks_cluster" "eks"{
    name = var.cluster_Name
    version = var.cluster_version

    access_config {
      authentication_mode = "API_AND_CONFIG_MAP"
      bootstrap_cluster_creator_admin_permissions = true
    }

    role_arn = module.iam_role.IAM_Details["Role_Arn"]

    vpc_config {
      endpoint_public_access = true
      subnet_ids = [for name in module.vpc.Public_Subnet_Details: name.Id]
    }

    tags = merge(var.tags, {
      Created = formatdate("YYYY-MM-DD", timestamp())
    })
}
