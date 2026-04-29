resource "aws_eks_node_group" "eks_ng"{
    cluster_name = aws_eks_cluster.eks.name

    node_group_name = var.node_Group_Name 
    version = var.node_Group_Version
    instance_types = var.instance_types

    node_role_arn = aws_iam_role.example.arn
    subnet_ids = aws_subnet.ex[*].id

    scaling_config {
      desired_size = 1
      max_size = 2
      min_size = 1
    }

    update_config {
      max_unavailable = 1
    }

    lifecycle {
      ignore_changes = [ scaling_config ]
    }

    tags = merge(var.tags, {
      Created = formatdate("YYYY-MM-DD", timestamp())
    })
}
