resource "aws_eks_cluster" "eks"{
    name = var.cluster_Name
    version = var.cluster_version

    access_config {
      authentication_mode = "API_AND_CONFIG_MAP"
    }

    role_arn = aws_iam_role.cluster.arn

    vpc_config {
      endpoint_public_access = true

      subnet_ids = [
        aws_subnet.sub.id,
        aws_subnet.sub2.id
      ]
    }

    
}