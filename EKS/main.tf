resource "aws_eks_cluster" "eks"{
    name = var.cluster_Name
    version = var.cluster_version


    role_arn = module.iam_role.IAM_Details["Role_Arn"]

    vpc_config {

      subnet_ids = [for name in module.vpc.Public_Subnet_Details: name.Id]
    }

    tags = merge(var.tags, {
      Created = formatdate("YYYY-MM-DD", timestamp())
    })
}
