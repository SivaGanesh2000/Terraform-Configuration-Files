resource "aws_eks_node_group" "eks_ng"{
    cluster_name = aws_eks_cluster.eks.name

    node_group_name = var.node_Group_Name 
    version = var.node_Group_Version
    instance_types = var.instance_types

    node_role_arn = module.node_iam_role.IAM_Details["Role_Arn"]
    subnet_ids = concat([for name in module.vpc.Public_Subnet_Details: name.Id], 
                        [for subnet_name in module.vpc.Private_Subnet_Details: subnet_name.id])

    scaling_config {
      desired_size = 1
      max_size = 2
      min_size = 1
    }

    update_config {
      max_unavailable = 1
    }

    lifecycle {
      ignore_changes = [ scaling_config, tags ]
    }

    tags = merge(var.tags, {
      Name = try(var.tags["Name"], "EKS-Worker-Node")
      Created = formatdate("YYYY-MM-DD", timestamp())
    })
}
